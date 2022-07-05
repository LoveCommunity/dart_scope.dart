import 'dart:async';
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';
import 'package:typedef_foundation/typedef_foundation.dart';

import '../configurables/configurable.dart';
import '../scope_methods/disposable_sink.dart';
import '../scope_methods/scope_expose.dart';
import '../shared/build_scope.dart';
import 'scope.dart';

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
    final getter = _storage[T]?[name] as Getter<T>?;
    return getter?.call();
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

  @override
  void addDisposable(Disposable disposable) {
    _disposables.addDisposable(disposable);
  }

  void addDisposables(List<Disposable> disposables) {
    _disposables.addDisposables(disposables);
  }

  @override
  void dispose() {
    _disposables.dispose();
  }
}

