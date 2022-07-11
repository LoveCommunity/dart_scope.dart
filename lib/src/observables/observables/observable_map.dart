
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import 'observable.dart';
import '../observers/observer.dart';

@internal
class ObservableMap<T, R> implements Observable<R> {
  
  const ObservableMap({
    required R Function(T) convert,
    required Observable<T> child,
  }): _convert = convert,
    _child = child;

  final R Function(T) _convert;
  final Observable<T> _child;

  @override
  Disposable observe(OnData<R> onData) {
    return _child.observe((data) {
      final result = _convert(data);
      onData(result);
    });
  }
}
