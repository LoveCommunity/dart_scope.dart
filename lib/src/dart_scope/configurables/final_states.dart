
import '../../dart_observable/states/states.dart';
import '../../dart_observable/states/states_activated.dart';
import '../shared/typedefs.dart';

import 'final.dart';

class FinalStates<T> extends FinalStatesBase<T> {

  FinalStates({
    Object? name,
    required Equal<States<T>> equal,
  }): super(
    name: name,
    equal: equal,
    late: false,
  );
}

class LateFinalStates<T> extends FinalStatesBase<T> {

  LateFinalStates({
    Object? name,
    required Equal<States<T>> equal,
  }): super(
    name: name,
    equal: equal,
    late: true,
  );
}

class FinalStatesBase<T> extends FinalBase<StatesActivated<T>> {

  FinalStatesBase({
    required Object? name,
    required Equal<States<T>> equal,
    required bool late,
  }): super(
    name: name,
    equal: _superEqual(equal),
    expose: _superExpose(name),
    dispose: _superDispose(),
    late: late,
  );
}

Equal<StatesActivated<T>> _superEqual<T>(Equal<States<T>> equal) {
  return (scope) => equal(scope)
    .activated();
}

ValueExpose<StatesActivated<T>> _superExpose<T>(Object? name) {
  return (scope, getActivated) {
    scope.expose<States<T>>(
      name: name, 
      expose: () => getActivated().states,
    );
  };
}

ValueDispose<StatesActivated<T>> _superDispose<T>() {
  return (activated) => activated.dispose();
}
