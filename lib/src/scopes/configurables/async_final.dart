
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
    ValueExpose<T>? expose,
    ValueDispose<T>? dispose,
  }): _name = name,
    _equal = equal,
    _expose = expose,
    _dispose = dispose;

  final Object? _name;
  final Equal<Future<T>> _equal;
  final ValueExpose<T>? _expose;
  final ValueDispose<T>? _dispose;

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
