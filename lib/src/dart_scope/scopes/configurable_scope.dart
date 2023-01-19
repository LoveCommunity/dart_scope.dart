import 'dart:async';
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';
import 'package:typedef_foundation/typedef_foundation.dart';

import '../configurables/configurable.dart';
import '../scope_methods/disposable_sink.dart';
import '../scope_methods/scope_expose.dart';
import '../shared/build_scope.dart';
import 'scope.dart';

/// `ConfigurableScope` is a draft of scope that can be configured with
/// `scope.expose` and `scope.addDispose` methods, it is often used
/// during scope creation.
/// 
/// Normal `Scope` can not been configured after creation.
/// 
/// Not Feasible:
/// ```dart
/// final Scope rootScope = await Scope.root([]);
/// 
/// final repository = Repository();
/// rootScope.expose<Repository>( // Error: 'scope.expose' isn't defined
///   expose: () => repository
/// );
/// ```
/// 
/// It's recommended to configure `scope` during creation 
/// via `ConfigurableScope`.
/// 
/// Feasible:
/// ```dart
/// final Scope rootScope = await Scope.root([
///   Configurable((ConfigurableScope scope) {
///     final repository = Repository();
///     scope.expose<Repository>( // works as expected
///       expose: () => repository
///     );
///   })
/// ]);
/// ```
/// 
abstract class ConfigurableScope implements Scope, ScopeExpose, DisposableSink {
  @internal
  factory ConfigurableScope() = _ConfigurableScopeImpl;
}

typedef _Storage = Map<Type, Map<Object?, Function>>;

class _ConfigurableScopeImpl implements ConfigurableScope {
  _ConfigurableScopeImpl():
    _storage = {};

  _ConfigurableScopeImpl._fromStorage(_Storage storage):
    _storage = storage
      .map((key, value) => MapEntry(key, Map.of(value)));

  final _Storage _storage;
  final _disposables = CompositeDisposable();

  @override
  T? getOrNull<T>({
    Object? name,
  }) {
    final getValue = _storage[T]?[name] as Getter<T>?;
    return getValue?.call();
  }

  @override
  bool has<T>({
    Object? name,
  }) {
    return _storage.containsKey(T) && _storage[T]!.containsKey(name);
  }

  @override
  void expose<T>({
    Object? name,
    required Getter<T> expose,
  }) {
    if (!_storage.containsKey(T)) {
      _storage[T] = <Object?, Getter<T>>{};
    }
    _storage[T]![name] = expose;
  }

  @override
  FutureOr<Scope> push(List<Configurable> configure) {
    final scope = _ConfigurableScopeImpl._fromStorage(_storage);
    return buildScope(configure, scope);
  }
  
  /// Use `scope.addDisposable(...)` to register dispose logic, that will
  /// run when scope been disposed:
  /// ```dart
  /// final rootScope = await Scope.root([
  ///   Configurable((scope) {
  ///     ...
  ///     final disposable = Disposable(() {
  ///       print('dispose resource');
  ///     });
  ///     scope.addDisposable(disposable);
  ///   }),
  /// ]);
  /// 
  /// rootScope.dispose(); // prints: `dispose resource`
  /// ```
  /// 
  /// As a side note, if multiple disposables has been added, 
  /// disposing order is reversed from been added:
  /// ```dart
  /// final rootScope = await Scope.root([
  ///   Configurable((scope) {
  ///     ...// other configuration
  ///     final disposable1 = Disposable(() {
  ///       print('dispose resource1');
  ///     });
  ///     final disposable2 = Disposable(() {
  ///       print('dispose resource2');
  ///     });
  ///     // added in ascending order 1, 2
  ///     scope.addDisposable(disposable1);
  ///     scope.addDisposable(disposable2);
  ///   }),
  /// ]);
  /// 
  /// // dispose in descending order 2, 1
  /// rootScope.dispose(); // prints: `dispose resource2`
  ///                      //         `dispose resource1`
  /// ```
  @override
  void addDisposable(Disposable disposable) {
    _disposables.addDisposable(disposable);
  }

  /// Use `scope.addDisposables(...)` to register multiple dispose logic, 
  /// that will run when scope been disposed:
  /// 
  /// ```dart
  /// final rootScope = await Scope.root([
  ///   Configurable((scope) {
  ///     ...// other configuration
  ///     final disposable1 = Disposable(() {
  ///       print('dispose resource1');
  ///     });
  ///     final disposable2 = Disposable(() {
  ///       print('dispose resource2');
  ///     });
  ///     scope.addDisposables([
  ///       disposable1,
  ///       disposable2,
  ///     ]);
  ///   }),
  /// ]);
  /// 
  /// rootScope.dispose(); // prints: `dispose resource2`
  ///                      //         `dispose resource1`
  /// ```
  /// 
  /// As a side note, disposing order is reversed from been added.
  @override
  void addDisposables(List<Disposable> disposables) {
    _disposables.addDisposables(disposables);
  }

  @override
  void dispose() {
    _disposables.dispose();
  }
}

