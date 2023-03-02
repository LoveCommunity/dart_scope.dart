
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import 'observable.dart';
import '../observers/observer.dart';

@internal
class ObservableMap<T, R> implements Observable<R> {
  
  const ObservableMap({
    required R Function(T) convert,
    required Observable<T> source,
  }): _convert = convert,
    _source = source;

  final R Function(T) _convert;
  final Observable<T> _source;

  @override
  Disposable observe(OnData<R> onData) {
    return _source.observe((data) {
      final result = _convert(data);
      onData(result);
    });
  }
}
