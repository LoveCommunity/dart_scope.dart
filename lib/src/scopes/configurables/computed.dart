import 'package:typedef_equals/typedef_equals.dart';

import '../../observables/states/states.dart';
import '../scope_methods/scope_get.dart';
import '../shared/typedefs.dart';

import 'final_states.dart';

class Computed<T, R> extends FinalStatesBase<R> {

  Computed({
    Object? name,
    Object? statesName,
    required R Function(ScopeGet scope, T) compute,
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
