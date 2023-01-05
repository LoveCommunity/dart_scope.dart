
import 'dart:async';
import 'package:disposal/disposal.dart';

import '../configurables/configurable.dart';
import '../scope_methods/scope_get.dart';
import '../scope_methods/scope_push.dart';
import '../shared/build_scope.dart';

import 'configurable_scope.dart';

/// `Scope` is the range that something within it can be accessed. 
abstract class Scope implements ScopeGet, ScopePush, Disposable {

  /// Use `Scope.root(...)` to create a top level scope with configurations:
  /// 
  /// ```dart
  /// Future<void> scopeRootExample() async {
  ///   final rootScope = await Scope.root([
  ///     Final<Repository>(name: 'repository', equal: (scope) => Repository()),
  ///     Final<AppNotifier>(name: 'appNotifier', equal: (scope) => AppNotifier(
  ///       repository: scope.get<Repository>(name: 'repository'),
  ///     )),
  ///   ]);
  /// 
  ///   final myRepository = rootScope.get<Repository>(name: 'repository');
  ///   final myAppNotifier = rootScope.get<AppNotifier>(name: 'appNotifier');
  /// }
  /// ```
  /// 
  /// Which simulates:
  /// 
  /// ```dart
  /// void rootScope() { 
  /// 
  ///   final Repository repository = Repository();
  ///   final AppNotifier appNotifier = AppNotifier(
  ///     repository: repository,
  ///   );
  /// 
  ///   final myRepository = repository;
  ///   final myAppNotifier = appNotifier;
  /// }
  /// ```
  /// 
  static FutureOr<Scope> root(List<Configurable> configure) => _scopeRoot(configure);

  /// As opposite to `scope.push`, scope can also be disposed/popped. 
  /// We can register dispose logic, that will run when scope been disposed: 
  /// 
  /// ```dart
  /// Future<void> scopeDisposeExample() async {
  ///   final rootScope = await Scope.root([
  ///     Final<Repository>(equal: (scope) => Repository()),
  ///     Final<AppNotifier>(
  ///       equal: (scope) => AppNotifier(
  ///         repository: scope.get<Repository>(),
  ///       ),
  ///       // register dispose instance logic
  ///       dispose: (appNotifier) => appNotifier.dispose(),
  ///     ),
  ///   ]);
  /// 
  ///   // dispose scope will also dispose `appNotifier`
  ///   rootScope.dispose();
  /// }
  /// ```
  /// 
  @override
  void dispose();
}

FutureOr<Scope> _scopeRoot(List<Configurable> configure) => buildScope(configure, ConfigurableScope());
