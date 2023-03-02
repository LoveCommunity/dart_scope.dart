
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'observable.dart';

@internal
class ObservableWhere<T> implements Observable<T> {

  const ObservableWhere({
    required bool Function(T) test,
    required Observable<T> source,
  }): _test = test,
    _source = source;

  final bool Function(T) _test;
  final Observable<T> _source;

  @override
  Disposable observe(OnData<T> onData) {
    void newOnData(T data) {
      if (_test(data)) {
        onData(data);
      }
    }
    return _source.observe(newOnData);
  }
}
