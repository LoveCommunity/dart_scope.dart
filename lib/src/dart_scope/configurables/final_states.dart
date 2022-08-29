
import '../../dart_observable/states/states.dart';
import '../../dart_observable/states/states_activated.dart';
import '../shared/typedefs.dart';

import 'final.dart';

class FinalStates<T> extends FinalBase<StatesActivated<T>> {

  FinalStates({
    Object? name,
    required Equal<States<T>> equal,
    bool lazy = true,
  }): super(
    name: name,
    equal: _superEqual(equal),
    expose: _superExpose(name),
    dispose: _superDispose(),
    late: lazy,
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
