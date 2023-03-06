
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'base_observable.dart';

@internal
class ObservableWhere<T> extends PipeObservable<T, T> {

  const ObservableWhere({
    required bool Function(T) test,
    required super.source,
  }): _test = test;

  final bool Function(T) _test;

  @override
  Disposable observe(OnData<T> onData) {
    void newOnData(T data) {
      if (_test(data)) {
        onData(data);
      }
    }
    return source.observe(newOnData);
  }
}
