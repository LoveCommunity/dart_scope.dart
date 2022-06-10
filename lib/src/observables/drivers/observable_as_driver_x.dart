
import '../observables/observable.dart';
import 'driver.dart';

extension ObservableAsDriverX<T> on Observable<T> {

  Driver<T> asDriver() => Driver<T>.from(this);
}
