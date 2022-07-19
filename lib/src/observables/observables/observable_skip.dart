
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import 'observable.dart';
import '../observers/observer.dart';

@internal
class ObservableSkip<T> implements Observable<T> {

  const ObservableSkip({
    required int n,
    required Observable<T> child,
  }): _n = n,
    _child = child;

  final int _n;
  final Observable<T> _child;

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
    return _child.observe(newOnData);
  }
}
