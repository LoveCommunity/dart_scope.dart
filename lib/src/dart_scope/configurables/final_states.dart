
import '../../dart_observable/states/states.dart';
import '../../dart_observable/states/states_activated.dart';
import '../shared/typedefs.dart';

import 'final.dart';

class FinalStates<T> extends Final<StatesActivated<T>> {

  FinalStates({
    super.name,
    required Equal<States<T>> equal,
    super.lazy,
  }): super(
    equal: _superEqual(equal),
    expose: _superExpose(name),
    dispose: _superDispose(),
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
