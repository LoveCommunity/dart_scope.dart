import 'dart:async';

import '../scopes/configurable_scope.dart';
import 'configurable_combine.dart';
import 'configurable_function.dart';

/// `ConfigureScope` is a function describe how to configure scope.
typedef ConfigureScope = FutureOr<void> Function(ConfigurableScope scope);

/// `Configurable` is configuration for scope.
/// 
/// Technical speaking, `Configurable` is an interface that 
/// has a `configure` method:
/// 
/// ```dart
/// abstract class Configurable {
///   FutureOr<void> configure(ConfigurableScope scope);
/// }
/// ```
/// 
/// This `configure` method is used to configure scope 
/// during its creation.
/// 
/// Example:
/// 
///  ```dart
/// class MyConfigurable implements Configurable {
/// 
///   @override
///   FutureOr<void> configure(ConfigurableScope scope) {
///     late final repository = Repository();
///     late final appNotifier = AppNotifier(
///       repository: repository,
///     );
///     scope.expose<Repository>(expose: () => repository);
///     scope.expose<AppNotifier>(expose: () => appNotifier);
///     scope.addDispose(() {
///       appNotifier.dispose();
///     });
///   }  
/// }
/// ```
/// 
/// Then, using this configuration:
/// 
/// ```dart
/// void main() async {
///   // create scope using configuration
///   final scope = await scope.root([
///     MyConfigurable(),
///   ]);
///   
///   // resolve instances
///   final repository = scope.get<Repository>();
///   final appNotifier = scope.get<AppNotifier>();
/// }
/// ```
/// 
abstract class Configurable {

  /// `configure` is used to configure scope synchronously 
  /// or asynchronously.
  /// 
  /// Return `void` if it's synchronous configuration:
  /// ```dart
  /// class SyncConfigurable implements Configurable {
  /// 
  ///   @override
  ///   FutureOr<void> configure(ConfigurableScope scope) {
  ///     final repository = Repository();
  ///     scope.expose<Repository>(expose: () => repository);
  ///   }
  /// }
  /// ```
  /// 
  /// Return `Future<void>` if it's asynchronous configuration:
  /// ```dart
  /// class AsyncConfigurable implements Configurable {
  /// 
  ///   @override
  ///   FutureOr<void> configure(...) async { // use `async` here
  ///     // use `await` here
  ///     final repository = await createRepositoryAsync();
  ///     scope.expose<Repository>(expose: () => repository);
  ///   }
  /// }
  /// ```
  /// 
  /// When all configurations are synchronous, scope will be 
  /// returned synchronously:
  /// ```dart
  /// final scope = Scope.root([
  ///   SyncConfigurable(), // use sync configuration
  /// ]) as Scope;          // return `Scope`
  /// ```
  /// 
  /// When one of configurations is asynchronous, scope will be 
  /// returned asynchronously:
  /// ```dart
  /// final scope = Scope.root([
  ///   AsyncConfigurable(),  // use async configuration
  /// ]) as Future<Scope>;    // return `Future<Scope>`
  /// ```
  /// 
  FutureOr<void> configure(ConfigurableScope scope);

  /// Use `Configurable(...)` to create an inline configurable.
  /// 
  /// ```dart
  /// final scope = await Scope.root([
  ///   Configurable((scope) {  // an inline `Configurable`
  ///     final repository = Repository();
  ///     scope.expose<Repository>(expose: () => repository);
  ///   }),
  /// ]);
  /// ```
  /// 
  /// Above `(scope) { ... }` is the `configure` method been
  /// used to configuring scope.
  /// 
  const factory Configurable(ConfigureScope configure) = ConfigurableFunction;

  /// Combine multiple `Configurable`s into one `Configurable`.
  const factory Configurable.combine({
    required List<Configurable> configurables,
  }) = ConfigurableCombine.impl;
}

