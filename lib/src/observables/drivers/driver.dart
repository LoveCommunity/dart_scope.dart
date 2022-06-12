
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import '../observables/observable.dart';

class Driver<T> {

  Driver(
    Observe<T> drive
  ): this.from(Observable(drive));

  const Driver.from(this.observable);

  final Observable<T> observable;

  Disposable drive(OnData<T> onData) {
    return observable.observe(onData);
  }
}
