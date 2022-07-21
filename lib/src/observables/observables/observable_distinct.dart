
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';
import 'package:typedef_equals/typedef_equals.dart';

import '../../shared/value.dart';
import '../observers/observer.dart';
import 'observable.dart';

@internal
class ObservableDistinct<T> implements Observable<T> {
  const ObservableDistinct({
    required Equals<T>? equals,
    required Observable<T> observable,
  }): _equals = equals ?? defaultEquals,
    _observable = observable;

  final Equals<T> _equals;
  final Observable<T> _observable;

  @override
  Disposable observe(OnData<T> onData) {
    Value<T>? oldData;
    void newOnData(T data) {
      final dataChanged = oldData == null || !_equals(oldData!.value, data);
      if (dataChanged) {
        onData(data);
        oldData = Value(data);
      }
    }
    return _observable.observe(newOnData);
  }
}

