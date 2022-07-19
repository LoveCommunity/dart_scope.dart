
import '../../observables/states/states.dart';
import '../../observables/states/states_activated.dart';
import '../shared/expose_in_scope.dart';
import '../shared/typedefs.dart';

import 'final.dart';

class FinalStates<T> extends FinalStatesBase<T> {

  FinalStates({
    Object? name,
    required Equal<States<T>> equal,
    InstanceExpose<States<T>>? expose,
  }): super(
    name: name,
    equal: equal,
    expose: expose,
    late: false,
  );
}

class LateFinalStates<T> extends FinalStatesBase<T> {

  LateFinalStates({
    Object? name,
    required Equal<States<T>> equal,
    InstanceExpose<States<T>>? expose,
  }): super(
    name: name,
    equal: equal,
    expose: expose,
    late: true,
  );
}

class FinalStatesBase<T> extends FinalBase<StatesActivated<T>> {

  FinalStatesBase({
    required Object? name,
    required Equal<States<T>> equal,
    required InstanceExpose<States<T>>? expose,
    required bool late,
  }): super(
    name: name,
    equal: _superEqual(equal),
    expose: _superExpose(name, expose),
    dispose: _superDispose(),
    late: late,
  );
}

Equal<StatesActivated<T>> _superEqual<T>(Equal<States<T>> equal) {
  return (scope) => equal(scope)
    .activated();
}

InstanceExpose<StatesActivated<T>> _superExpose<T>(
  Object? name, 
  InstanceExpose<States<T>>? expose
) {
  final statesExpose = expose ?? defaultExpose(name);
  return (scope, getActivated) {
    final getStates = () => getActivated().states;
    statesExpose(scope, getStates);
  };
}

ValueDispose<StatesActivated<T>> _superDispose<T>() {
  return (activated) => activated.dispose();
}
