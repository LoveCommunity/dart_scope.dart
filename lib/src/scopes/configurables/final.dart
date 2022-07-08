import 'dart:async';
import 'package:typedef_foundation/typedef_foundation.dart';

import '../scopes/configurable_scope.dart';
import '../shared/expose_in_scope.dart';
import '../shared/typedefs.dart';

import 'configurable.dart';

class Final<T> extends _Final<T> {

  const Final({
    Object? name,
    required Equal<T> equal,
    InstanceExpose<T>? expose,
    InstanceDispose<T>? dispose,
  }): super(
    name: name,
    equal: equal,
    expose: expose,
    dispose: dispose,
    late: false,
  );
}

class LateFinal<T> extends _Final<T> {

  const LateFinal({
    Object? name,
    required Equal<T> equal,
    InstanceExpose<T>? expose,
    InstanceDispose<T>? dispose,
  }): super(
    name: name,
    equal: equal,
    expose: expose,
    dispose: dispose,
    late: true,
  );
}

class _Final<T> implements Configurable {

  const _Final({
    Object? name,
    required Equal<T> equal,
    InstanceExpose<T>? expose,
    InstanceDispose<T>? dispose,
    required bool late,
  }): _name = name,
    _equal = equal,
    _expose = expose,
    _dispose = dispose,
    _late = late;

  final Object? _name;
  final Equal<T> _equal;
  final InstanceExpose<T>? _expose;
  final InstanceDispose<T>? _dispose;
  final bool _late;

  @override
  FutureOr<void> configure(ConfigurableScope scope) {

    final Getter<T> getter;
    if (!_late) {
      final instance = _equal(scope);
      getter = () => instance;
    } else {
      late final instance = _equal(scope);
      getter = () => instance;
    }
    
    exposeInScope(
      scope: scope,
      name: _name,
      getter: getter,
      expose: _expose,
      dispose: _dispose,
    );
  }
}

