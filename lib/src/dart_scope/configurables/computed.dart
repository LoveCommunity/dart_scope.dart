import 'package:meta/meta.dart';
import 'package:typedef_equals/typedef_equals.dart';

import '../../dart_observable/states/states.dart';
import '../scope_methods/scope_get.dart';
import '../shared/typedefs.dart';

import 'final_states.dart';

@experimental
class Computed<T, R> extends FinalStates<R> {

  Computed({
    super.name,
    Object? statesName,
    required R Function(ScopeGet scope, T it) compute,
    Equals<R>? equals,
    super.lazy,
  }): super(
    equal: _superEqual<T, R>(
      statesName,
      compute,
      equals,
    ),
  );
}

@experimental
class Computed2<T1, T2, R> extends FinalStates<R> {

  Computed2({
    super.name,
    Object? statesName1,
    Object? statesName2,
    required R Function(ScopeGet scope, T1 it1, T2 it2) compute,
    Equals<R>? equals,
    super.lazy,
  }): super(
    equal: _superEqual2<T1, T2, R>(
      statesName1,
      statesName2,
      compute,
      equals,
    ),
  );
}

@experimental
class Computed3<T1, T2, T3, R> extends FinalStates<R> {

  Computed3({
    super.name,
    Object? statesName1,
    Object? statesName2,
    Object? statesName3,
    required R Function(ScopeGet scope, T1 it1, T2 it2, T3 it3) compute,
    Equals<R>? equals,
    super.lazy,
  }): super(
    equal: _superEqual3<T1, T2, T3, R>(
      statesName1,
      statesName2,
      statesName3,
      compute,
      equals,
    ),
  );
}

@experimental
class Computed4<T1, T2, T3, T4, R> extends FinalStates<R> {

  Computed4({
    super.name,
    Object? statesName1,
    Object? statesName2,
    Object? statesName3,
    Object? statesName4,
    required R Function(ScopeGet scope, T1 it1, T2 it2, T3 it3, T4 it4) compute,
    Equals<R>? equals,
    super.lazy,
  }): super(
    equal: _superEqual4<T1, T2, T3, T4, R>(
      statesName1,
      statesName2,
      statesName3,
      statesName4,
      compute,
      equals,
    ),
  );
}

@experimental
class Computed5<T1, T2, T3, T4, T5, R> extends FinalStates<R> {

  Computed5({
    super.name,
    Object? statesName1,
    Object? statesName2,
    Object? statesName3,
    Object? statesName4,
    Object? statesName5,
    required R Function(
      ScopeGet scope, T1 it1, T2 it2, T3 it3, 
      T4 it4, T5 it5
    ) compute,
    Equals<R>? equals,
    super.lazy,
  }): super(
    equal: _superEqual5<T1, T2, T3, T4, T5, R>(
      statesName1,
      statesName2,
      statesName3,
      statesName4,
      statesName5,
      compute,
      equals,
    ),
  );
}

@experimental
class Computed6<T1, T2, T3, T4, T5, T6, R> extends FinalStates<R> {

  Computed6({
    super.name,
    Object? statesName1,
    Object? statesName2,
    Object? statesName3,
    Object? statesName4,
    Object? statesName5,
    Object? statesName6,
    required R Function(
      ScopeGet scope, T1 it1, T2 it2, T3 it3, 
      T4 it4, T5 it5, T6 it6
    ) compute,
    Equals<R>? equals,
    super.lazy,
  }): super(
    equal: _superEqual6<T1, T2, T3, T4, T5, T6, R>(
      statesName1,
      statesName2,
      statesName3,
      statesName4,
      statesName5,
      statesName6,
      compute,
      equals,
    ),
  );
}

@experimental
class Computed7<T1, T2, T3, T4, T5, T6, T7, R> extends FinalStates<R> {

  Computed7({
    super.name,
    Object? statesName1,
    Object? statesName2,
    Object? statesName3,
    Object? statesName4,
    Object? statesName5,
    Object? statesName6,
    Object? statesName7,
    required R Function(
      ScopeGet scope, T1 it1, T2 it2, T3 it3, 
      T4 it4, T5 it5, T6 it6, T7 it7
    ) compute,
    Equals<R>? equals,
    super.lazy,
  }): super(
    equal: _superEqual7<T1, T2, T3, T4, T5, T6, T7, R>(
      statesName1,
      statesName2,
      statesName3,
      statesName4,
      statesName5,
      statesName6,
      statesName7,
      compute,
      equals,
    ),
  );
}

@experimental
class Computed8<T1, T2, T3, T4, T5, T6, T7, T8, R> extends FinalStates<R> {

  Computed8({
    super.name,
    Object? statesName1,
    Object? statesName2,
    Object? statesName3,
    Object? statesName4,
    Object? statesName5,
    Object? statesName6,
    Object? statesName7,
    Object? statesName8,
    required R Function(
      ScopeGet scope, T1 it1, T2 it2, T3 it3, 
      T4 it4, T5 it5, T6 it6, T7 it7, T8 it8
    ) compute,
    Equals<R>? equals,
    super.lazy,
  }): super(
    equal: _superEqual8<T1, T2, T3, T4, T5, T6, T7, T8, R>(
      statesName1,
      statesName2,
      statesName3,
      statesName4,
      statesName5,
      statesName6,
      statesName7,
      statesName8,
      compute,
      equals,
    ),
  );
}

@experimental
class Computed9<T1, T2, T3, T4, T5, T6, T7, T8, T9, R> extends FinalStates<R> {

  Computed9({
    super.name,
    Object? statesName1,
    Object? statesName2,
    Object? statesName3,
    Object? statesName4,
    Object? statesName5,
    Object? statesName6,
    Object? statesName7,
    Object? statesName8,
    Object? statesName9,
    required R Function(
      ScopeGet scope, T1 it1, T2 it2, T3 it3, 
      T4 it4, T5 it5, T6 it6, T7 it7, T8 it8, T9 it9
    ) compute,
    Equals<R>? equals,
    super.lazy,
  }): super(
    equal: _superEqual9<T1, T2, T3, T4, T5, T6, T7, T8, T9, R>(
      statesName1,
      statesName2,
      statesName3,
      statesName4,
      statesName5,
      statesName6,
      statesName7,
      statesName8,
      statesName9,
      compute,
      equals,
    ),
  );
}

Equal<States<R>> _superEqual<T, R>(
  Object? statesName,
  R Function(ScopeGet scope, T) compute,
  Equals<R>? equals,
) {
  return (scope) => scope
    .get<States<T>>(name: statesName)
    .convert<R>(
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
    .computed2<T1, T2, R>(
      states1: scope.get<States<T1>>(name: statesName1),
      states2: scope.get<States<T2>>(name: statesName2),
      compute: (it1, it2) => compute(scope, it1, it2),
      equals: equals,
    );
}

Equal<States<R>> _superEqual3<T1, T2, T3, R>(
  Object? statesName1,
  Object? statesName2,
  Object? statesName3,
  R Function(ScopeGet scope, T1 it1, T2 it2, T3 it3) compute,
  Equals<R>? equals,
) {
  return (scope) => States
    .computed3<T1, T2, T3, R>(
      states1: scope.get<States<T1>>(name: statesName1),
      states2: scope.get<States<T2>>(name: statesName2),
      states3: scope.get<States<T3>>(name: statesName3),
      compute: (it1, it2, it3) => compute(scope, it1, it2, it3),
      equals: equals,
    );
}

Equal<States<R>> _superEqual4<T1, T2, T3, T4, R>(
  Object? statesName1,
  Object? statesName2,
  Object? statesName3,
  Object? statesName4,
  R Function(ScopeGet scope, T1 it1, T2 it2, T3 it3, T4 it4) compute,
  Equals<R>? equals,
) {
  return (scope) => States
    .computed4<T1, T2, T3, T4, R>(
      states1: scope.get<States<T1>>(name: statesName1),
      states2: scope.get<States<T2>>(name: statesName2),
      states3: scope.get<States<T3>>(name: statesName3),
      states4: scope.get<States<T4>>(name: statesName4),
      compute: (it1, it2, it3, it4) => compute(scope, it1, it2, it3, it4),
      equals: equals,
    );
}

Equal<States<R>> _superEqual5<T1, T2, T3, T4, T5, R>(
  Object? statesName1,
  Object? statesName2,
  Object? statesName3,
  Object? statesName4,
  Object? statesName5,
  R Function(
    ScopeGet scope, T1 it1, T2 it2, T3 it3, 
    T4 it4, T5 it5
  ) compute,
  Equals<R>? equals,
) {
  return (scope) => States
    .computed5<T1, T2, T3, T4, T5, R>(
      states1: scope.get<States<T1>>(name: statesName1),
      states2: scope.get<States<T2>>(name: statesName2),
      states3: scope.get<States<T3>>(name: statesName3),
      states4: scope.get<States<T4>>(name: statesName4),
      states5: scope.get<States<T5>>(name: statesName5),
      compute: (it1, it2, it3, it4, it5) 
        => compute(scope, it1, it2, it3, it4, it5),
      equals: equals,
    );
}

Equal<States<R>> _superEqual6<T1, T2, T3, T4, T5, T6, R>(
  Object? statesName1,
  Object? statesName2,
  Object? statesName3,
  Object? statesName4,
  Object? statesName5,
  Object? statesName6,
  R Function(
    ScopeGet scope, T1 it1, T2 it2, T3 it3, 
    T4 it4, T5 it5, T6 it6
  ) compute,
  Equals<R>? equals,
) {
  return (scope) => States
    .computed6<T1, T2, T3, T4, T5, T6, R>(
      states1: scope.get<States<T1>>(name: statesName1),
      states2: scope.get<States<T2>>(name: statesName2),
      states3: scope.get<States<T3>>(name: statesName3),
      states4: scope.get<States<T4>>(name: statesName4),
      states5: scope.get<States<T5>>(name: statesName5),
      states6: scope.get<States<T6>>(name: statesName6),
      compute: (it1, it2, it3, it4, it5, it6) 
        => compute(scope, it1, it2, it3, it4, it5, it6),
      equals: equals,
    );
}

Equal<States<R>> _superEqual7<T1, T2, T3, T4, T5, T6, T7, R>(
  Object? statesName1,
  Object? statesName2,
  Object? statesName3,
  Object? statesName4,
  Object? statesName5,
  Object? statesName6,
  Object? statesName7,
  R Function(
    ScopeGet scope, T1 it1, T2 it2, T3 it3, 
    T4 it4, T5 it5, T6 it6, T7 it7
  ) compute,
  Equals<R>? equals,
) {
  return (scope) => States
    .computed7<T1, T2, T3, T4, T5, T6, T7, R>(
      states1: scope.get<States<T1>>(name: statesName1),
      states2: scope.get<States<T2>>(name: statesName2),
      states3: scope.get<States<T3>>(name: statesName3),
      states4: scope.get<States<T4>>(name: statesName4),
      states5: scope.get<States<T5>>(name: statesName5),
      states6: scope.get<States<T6>>(name: statesName6),
      states7: scope.get<States<T7>>(name: statesName7),
      compute: (it1, it2, it3, it4, it5, it6, it7) 
        => compute(scope, it1, it2, it3, it4, it5, it6, it7),
      equals: equals,
    );
}

Equal<States<R>> _superEqual8<T1, T2, T3, T4, T5, T6, T7, T8, R>(
  Object? statesName1,
  Object? statesName2,
  Object? statesName3,
  Object? statesName4,
  Object? statesName5,
  Object? statesName6,
  Object? statesName7,
  Object? statesName8,
  R Function(
    ScopeGet scope, T1 it1, T2 it2, T3 it3, 
    T4 it4, T5 it5, T6 it6, T7 it7, T8 it8
  ) compute,
  Equals<R>? equals,
) {
  return (scope) => States
    .computed8<T1, T2, T3, T4, T5, T6, T7, T8, R>(
      states1: scope.get<States<T1>>(name: statesName1),
      states2: scope.get<States<T2>>(name: statesName2),
      states3: scope.get<States<T3>>(name: statesName3),
      states4: scope.get<States<T4>>(name: statesName4),
      states5: scope.get<States<T5>>(name: statesName5),
      states6: scope.get<States<T6>>(name: statesName6),
      states7: scope.get<States<T7>>(name: statesName7),
      states8: scope.get<States<T8>>(name: statesName8),
      compute: (it1, it2, it3, it4, it5, it6, it7, it8) 
        => compute(scope, it1, it2, it3, it4, it5, it6, it7, it8),
      equals: equals,
    );
}

Equal<States<R>> _superEqual9<T1, T2, T3, T4, T5, T6, T7, T8, T9, R>(
  Object? statesName1,
  Object? statesName2,
  Object? statesName3,
  Object? statesName4,
  Object? statesName5,
  Object? statesName6,
  Object? statesName7,
  Object? statesName8,
  Object? statesName9,
  R Function(
    ScopeGet scope, T1 it1, T2 it2, T3 it3, 
    T4 it4, T5 it5, T6 it6, T7 it7, T8 it8, T9 it9
  ) compute,
  Equals<R>? equals,
) {
  return (scope) => States
    .computed9<T1, T2, T3, T4, T5, T6, T7, T8, T9, R>(
      states1: scope.get<States<T1>>(name: statesName1),
      states2: scope.get<States<T2>>(name: statesName2),
      states3: scope.get<States<T3>>(name: statesName3),
      states4: scope.get<States<T4>>(name: statesName4),
      states5: scope.get<States<T5>>(name: statesName5),
      states6: scope.get<States<T6>>(name: statesName6),
      states7: scope.get<States<T7>>(name: statesName7),
      states8: scope.get<States<T8>>(name: statesName8),
      states9: scope.get<States<T9>>(name: statesName9),
      compute: (it1, it2, it3, it4, it5, it6, it7, it8, it9) 
        => compute(scope, it1, it2, it3, it4, it5, it6, it7, it8, it9),
      equals: equals,
    );
}
