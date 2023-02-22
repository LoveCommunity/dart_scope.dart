
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'base_observable.dart';
import 'observable.dart';

@internal
class ObservableMap<T, R> extends PipeObservable<T, R> {
  
  const ObservableMap({
    required R Function(T) convert,
    required Observable<T> observable,
  }): _convert = convert,
    super(observable: observable);

  final R Function(T) _convert;

  @override
  Disposable observe(OnData<R> onData) {
    return observable.observe((data) {
      final result = _convert(data);
      onData(result);
    });
  }
}
