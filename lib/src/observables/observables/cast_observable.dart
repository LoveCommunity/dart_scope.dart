
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'observable.dart';

@internal
class CastObservable<T, R> implements Observable<R> {

  const CastObservable({
    required Observable<T> child,
  }): _child = child;

  final Observable<T> _child;

  @override
  Disposable observe(OnData<R> onData) {
    return _child.observe((data) {
      onData(data as R);
    });
  }
}
