
import 'dart:async';

import '../scopes/configurable_scope.dart';
import '../shared/typedefs.dart';
import '../shared/expose_in_scope.dart';

import 'configurable.dart';

/// `AsyncFinal` is configuration simulate asynchronous assignment
/// using `final` keyword.
/// 
class AsyncFinal<T> implements Configurable {

  /// Assign an instance asynchronously and exposing it in current scope.
  /// 
  /// So:
  /// ```dart
  /// final rootScope = await Scope.root([
  ///   AsyncFinal<Repository>(
  ///     name: 'repository',
  ///     equal: (scope) async {
  ///       return await createRepositoryAsync();
  ///     },
  ///   ),
  /// ]);
  /// ```
  /// 
  /// Simulates:
  /// ```dart
  /// void rootScope() async {
  ///   final repository = await createRepositoryAsync();
  /// }
  /// ```
  /// 
  /// Use `expose` parameter to override default exposing behavior. 
  /// Use `dispose` parameter to register dispose logic.
  /// 
  const AsyncFinal({
    Object? name,
    required Equal<Future<T>> equal,
    ExposeValue<T>? expose,
    DisposeValue<T>? dispose,
  }): _name = name,
    _equal = equal,
    _expose = expose,
    _dispose = dispose;

  final Object? _name;
  final Equal<Future<T>> _equal;
  final ExposeValue<T>? _expose;
  final DisposeValue<T>? _dispose;

  @override
  FutureOr<void> configure(ConfigurableScope scope) async {

    final value = await _equal(scope);
    T getValue() => value;

    exposeInScope(
      scope: scope,
      name: _name,
      getValue: getValue,
      expose: _expose,
      dispose: _dispose,
    );
  }
}
