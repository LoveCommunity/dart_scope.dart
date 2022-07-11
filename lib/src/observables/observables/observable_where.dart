
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'observable.dart';

@internal
class ObservableWhere<T> implements Observable<T> {

  const ObservableWhere({
    required bool Function(T) test,
    required Observable<T> child,
  }): _test = test,
    _child = child;

  final bool Function(T) _test;
  final Observable<T> _child;

  @override
  Disposable observe(OnData<T> onData) {
    final OnData<T> newOnData = (data) {
      if (_test(data)) {
        onData(data);
      }
    };
    return _child.observe(newOnData);
  }
}
