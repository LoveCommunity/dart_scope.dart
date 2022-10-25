import 'dart:async';
import 'package:typedef_foundation/typedef_foundation.dart';

import '../scopes/configurable_scope.dart';
import '../shared/expose_in_scope.dart';
import '../shared/typedefs.dart';

import 'configurable.dart';

class Final<T> implements Configurable {

  const Final({
    Object? name,
    required Equal<T> equal,
    ValueExpose<T>? expose,
    DisposeValue<T>? dispose,
    bool lazy = true,
  }): _name = name,
    _equal = equal,
    _expose = expose,
    _dispose = dispose,
    _lazy = lazy;

  final Object? _name;
  final Equal<T> _equal;
  final ValueExpose<T>? _expose;
  final DisposeValue<T>? _dispose;
  final bool _lazy;

  @override
  FutureOr<void> configure(ConfigurableScope scope) {

    final Getter<T> getValue;
    if (!_lazy) {
      final value = _equal(scope);
      getValue = () => value;
    } else {
      late final value = _equal(scope);
      getValue = () => value;
    }
    
    exposeInScope(
      scope: scope,
      name: _name,
      getValue: getValue,
      expose: _expose,
      dispose: _dispose,
    );
  }
}

