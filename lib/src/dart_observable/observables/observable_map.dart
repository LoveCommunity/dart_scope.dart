
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'base_observable.dart';

@internal
class ObservableMap<T, R> extends PipeObservable<T, R> {
  
  const ObservableMap({
    required R Function(T) convert,
    required super.source,
  }): _convert = convert;

  final R Function(T) _convert;

  @override
  Disposable observe(OnData<R> onData) {
    return source.observe((data) {
      final result = _convert(data);
      onData(result);
    });
  }
}
