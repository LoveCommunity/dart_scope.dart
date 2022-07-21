
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import 'observable.dart';
import '../observers/observer.dart';

@internal
class ObservableSkip<T> implements Observable<T> {

  const ObservableSkip({
    required int n,
    required Observable<T> observable,
  }): _n = n,
    _observable = observable;

  final int _n;
  final Observable<T> _observable;

  @override
  Disposable observe(OnData<T> onData) {
    int shouldSkip = _n;
    void newOnData(T data) {
      if (shouldSkip > 0) {
        shouldSkip -= 1;
      } else {
        onData(data);
      }
    }
    return _observable.observe(newOnData);
  }
}
