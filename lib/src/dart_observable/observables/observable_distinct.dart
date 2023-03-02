
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
    required this.equals,
    required this.source,
  });

  final Equals<T>? equals;
  final Observable<T> source;

  @override
  Disposable observe(OnData<T> onData) {
    return _Observation<T>(
      configuration: this,
      emit: onData,
    );
  }
}

class _Observation<T> extends Observation<ObservableDistinct<T>, T> implements Observer<T> {

  _Observation({
    required super.configuration, 
    required super.emit,
  });

  Value<T>? _oldData;
  late final Disposable _sourceObservation;
  late final Equals<T> _equals = configuration.equals ?? defaultEquals;

  @override
  void init() {
    _sourceObservation = configuration.source.observe(onData);
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
