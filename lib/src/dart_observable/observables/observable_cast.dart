
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'base_observable.dart';
import 'observable.dart';

@internal
class ObservableCast<T, R> extends PipeObservable<T, R> {

  const ObservableCast({
    required Observable<T> observable,
  }): super(observable: observable);

  @override
  Disposable observe(OnData<R> onData) {
    return observable.observe((data) {
      onData(data as R);
    });
  }
}
