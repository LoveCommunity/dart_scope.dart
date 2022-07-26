import 'package:typedef_equals/typedef_equals.dart';

import '../../observables/states/states.dart';
import '../scope_methods/scope_get.dart';
import '../shared/typedefs.dart';

import 'final_states.dart';

class Computed<T, R> extends FinalStatesBase<R> {

  Computed({
    Object? name,
    Object? statesName,
    required R Function(ScopeGet scope, T it) compute,
    Equals<R>? equals,
    bool late = true,
  }): super(
    name: name,
    equal: _superEqual<T, R>(
      statesName,
      compute,
      equals,
    ),
    late: late,
  );
}

class Computed2<T1, T2, R> extends FinalStatesBase<R> {

  Computed2({
    Object? name,
    Object? statesName1,
    Object? statesName2,
    required R Function(ScopeGet scope, T1 it1, T2 it2) compute,
    Equals<R>? equals,
    bool late = true,
  }): super(
    name: name,
    equal: _superEqual2<T1, T2, R>(
      statesName1,
      statesName2,
      compute,
      equals,
    ),
    late: late,
  );
}

Equal<States<R>> _superEqual<T, R>(
  Object? statesName,
  R Function(ScopeGet scope, T) compute,
  Equals<R>? equals,
) {
  return (scope) => scope
    .get<States<T>>(name: statesName)
    .select<R>(
      (it) => compute(scope, it),
      equals: equals,
    );
}

Equal<States<R>> _superEqual2<T1, T2, R>(
  Object? statesName1,
  Object? statesName2,
  R Function(ScopeGet scope, T1 it1, T2 it2) compute,
  Equals<R>? equals,
) {
  return (scope) => States
    .combine2<T1, T2, R>(
      states1: scope.get<States<T1>>(name: statesName1),
      states2: scope.get<States<T2>>(name: statesName2),
      combiner: (it1, it2) => compute(scope, it1, it2),
    )
    .distinct(equals);
}

