
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'observable.dart';

@internal
class ObservableCast<T, R> implements Observable<R> {

  const ObservableCast({
    required Observable<T> source,
  }): _source = source;

  final Observable<T> _source;

  @override
  Disposable observe(OnData<R> onData) {
    return _source.observe((data) {
      onData(data as R);
    });
  }
}
