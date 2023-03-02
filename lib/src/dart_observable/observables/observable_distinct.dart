
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';
import 'package:typedef_equals/typedef_equals.dart';

import '../../shared/value.dart';
import '../observers/observer.dart';
import 'observable.dart';
import 'observation.dart';

@internal
class ObservableDistinct<T> implements Observable<T> {
  const ObservableDistinct({
    required Equals<T>? equals,
    required Observable<T> source,
  }): _equals = equals ?? defaultEquals,
    _source = source;

  final Equals<T> _equals;
  final Observable<T> _source;

  @override
  Disposable observe(OnData<T> onData) {
    return _Observation<T>(
      equals: _equals,
      source: _source,
      emit: onData,
    );
  }
}

class _Observation<T> extends Observation<T> implements Observer<T> {

  _Observation({
    required Equals<T> equals,
    required Observable<T> source,
    required super.emit,
  }): _equals = equals,
    _source = source;

  final Equals<T> _equals;
  final Observable<T> _source;

  Value<T>? _oldData;
  late final Disposable _sourceObservation;

  @override
  void init() {
    _sourceObservation = _source.observe(onData);
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
