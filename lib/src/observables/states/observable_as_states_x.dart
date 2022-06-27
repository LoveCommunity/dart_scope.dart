
import '../observables/observable.dart';
import 'states.dart';

extension ObservableAsStatesX<T> on Observable<T> {

  States<T> asStates() => States<T>.from(this);
}
