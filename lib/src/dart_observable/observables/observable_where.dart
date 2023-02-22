
import 'package:dart_scope/src/dart_observable/observables/base_observable.dart';
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'observable.dart';

@internal
class ObservableWhere<T> extends PipeObservable<T, T> {

  const ObservableWhere({
    required bool Function(T) test,
    required Observable<T> observable,
  }): _test = test,
  super(observable: observable);

  final bool Function(T) _test;

  @override
  Disposable observe(OnData<T> onData) {
    void newOnData(T data) {
      if (_test(data)) {
        onData(data);
      }
    }
    return observable.observe(newOnData);
  }
}
