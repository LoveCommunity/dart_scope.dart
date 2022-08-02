
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import 'observable.dart';
import '../observers/observer.dart';

@internal
class ObservableMap<T, R> implements Observable<R> {
  
  const ObservableMap({
    required R Function(T) convert,
    required Observable<T> observable,
  }): _convert = convert,
    _observable = observable;

  final R Function(T) _convert;
  final Observable<T> _observable;

  @override
  Disposable observe(OnData<R> onData) {
    return _observable.observe((data) {
      final result = _convert(data);
      onData(result);
    });
  }
}
