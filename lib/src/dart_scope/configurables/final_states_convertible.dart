import 'dart:async';
import 'package:typedef_foundation/typedef_foundation.dart';

import '../../dart_observable/states/states.dart';

import '../scopes/configurable_scope.dart';
import '../scope_methods/disposable_sink.dart';
import '../scope_methods/scope_expose.dart';
import '../shared/typedefs.dart';

import 'configurable.dart';

typedef StatesConvertibleExpose<T, E> = void Function(
  ScopeExpose scope, 
  Getter<T> getValue, 
  Getter<States<E>> getStates
);

class FinalStatesConvertible<T, E> implements Configurable {

  const FinalStatesConvertible({
    Object? name,
    required Equal<T> equal,
    Object? statesName,
    required States<E> Function(T it) statesEqual,
    StatesConvertibleExpose<T, E>? expose,
    ValueDispose<T>? dispose,
    bool lazy = true,
  }): _name = name,
    _equal = equal,
    _statesName = statesName,
    _statesEqual = statesEqual,
    _expose = expose,
    _dispose = dispose,
    _lazy = lazy;

  final Object? _name;
  final Equal<T> _equal;
  final Object? _statesName;
  final States<E> Function(T it) _statesEqual;
  final StatesConvertibleExpose<T, E>? _expose;
  final ValueDispose<T>? _dispose;
  final bool _lazy;

  @override
  FutureOr<void> configure(ConfigurableScope scope) {

    final Getter<T> getValue;
    final Getter<States<E>> getStates;

    if (!_lazy) {
      final value = _equal(scope);
      final states = _statesEqual(value);
      getValue = () => value;
      getStates = () => states;
    } else {
      late final value = _equal(scope);
      late final states = _statesEqual(value);
      getValue = () => value;
      getStates = () => states;
    }

    if (_expose != null) {
      _expose!(scope, getValue, getStates);
    } else {
      scope.expose<T>(name: _name, expose: getValue);
      scope.expose<States<E>>(name: _statesName, expose: getStates);
    }

    if (_dispose != null) {
      scope.addDispose(() {
        _dispose!(getValue());
      });
    }
  }
}


