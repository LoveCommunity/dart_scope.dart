
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';
import 'package:typedef_equals/typedef_equals.dart';

import '../../shared/value.dart';
import '../observers/observer.dart';
import 'base_observable.dart';
import 'observable.dart';
import 'observation.dart';

@internal
class ObservableDistinct<T> extends PipeObservable<T, T> {
  const ObservableDistinct({
    required Equals<T>? equals,
    required Observable<T> observable,
  }): _equals = equals ?? defaultEquals,
    super(observable: observable);

  final Equals<T> _equals;

  @override
  Disposable observe(OnData<T> onData) {
    return _Observation<T>(
      equals: _equals,
      observable: observable,
      emit: onData,
    );
  }
}

class _Observation<T> extends Observation<T> implements Observer<T> {

  _Observation({
    required Equals<T> equals,
    required Observable<T> observable,
    required OnData<T> emit,
  }): _equals = equals,
    _observable = observable,
    super(emit: emit);

  final Equals<T> _equals;
  final Observable<T> _observable;

  Value<T>? _oldData;
  late final Disposable _sourceObservation;

  @override
  void init() {
    _sourceObservation = _observable.observe(onData);
  }

  @override
  void onData(T data) {
    final dataChanged = _oldData == null || !_equals(_oldData!.value, data);
    if (dataChanged) {
      _oldData = Value(data);
      emit(data);
    }
  }

  @override
  void dispose() {
    _sourceObservation.dispose();
  }
}
