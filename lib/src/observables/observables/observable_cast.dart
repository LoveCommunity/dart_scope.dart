
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'observable.dart';

@internal
class ObservableCast<T, R> implements Observable<R> {

  const ObservableCast({
    required Observable<T> observable,
  }): _observable = observable;

  final Observable<T> _observable;

  @override
  Disposable observe(OnData<R> onData) {
    return _observable.observe((data) {
      onData(data as R);
    });
  }
}
