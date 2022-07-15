
import 'dart:async';
import 'package:typedef_foundation/typedef_foundation.dart';

import '../scopes/configurable_scope.dart';
import '../shared/typedefs.dart';
import '../shared/expose_in_scope.dart';

import 'configurable.dart';

class AsyncFinal<T> implements Configurable {

  const AsyncFinal({
    Object? name,
    required Equal<Future<T>> equal,
    InstanceExpose<T>? expose,
    InstanceDispose<T>? dispose,
  }): _name = name,
    _equal = equal,
    _expose = expose,
    _dispose = dispose;

  final Object? _name;
  final Equal<Future<T>> _equal;
  final InstanceExpose<T>? _expose;
  final InstanceDispose<T>? _dispose;

  @override
  FutureOr<void> configure(ConfigurableScope scope) async {

    final instance = await _equal(scope);
    final Getter<T> getter = () => instance;

    exposeInScope(
      scope: scope,
      name: _name,
      getter: getter,
      expose: _expose,
      dispose: _dispose,
    );
  }
}