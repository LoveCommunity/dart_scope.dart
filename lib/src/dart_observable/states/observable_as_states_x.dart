
import '../observables/observable.dart';
import 'states.dart';

/// An extension adds method `observable.asStates`
extension ObservableAsStatesX<T> on Observable<T> {
  
  /// Cast an Observable to States.
  States<T> asStates() {
    final observable = multicastReplay(1);
    return States<T>.from(observable);
  }
}
