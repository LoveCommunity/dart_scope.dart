
import '../../dart_observable/states/states.dart';
import '../../dart_observable/states/states_activated.dart';
import '../shared/typedefs.dart';

import 'final.dart';

class FinalStates<T> extends Final<StatesActivated<T>> {

  FinalStates({
    Object? name,
    required Equal<States<T>> equal,
    bool lazy = true,
  }): super(
    name: name,
    equal: _superEqual(equal),
    expose: _superExpose(name),
    dispose: _superDispose(),
    lazy: lazy,
  );
}

Equal<StatesActivated<T>> _superEqual<T>(Equal<States<T>> equal) {
  return (scope) => equal(scope)
    .activated();
}

ExposeValue<StatesActivated<T>> _superExpose<T>(Object? name) {
  return (scope, getActivated) {
    scope.expose<States<T>>(
      name: name, 
      expose: () => getActivated().states,
    );
  };
}

DisposeValue<StatesActivated<T>> _superDispose<T>() {
  return (activated) => activated.dispose();
}
