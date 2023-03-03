
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import 'observable.dart';
import 'observation.dart';
import '../observers/observer.dart';

@internal
class ObservableCreate<T> implements Observable<T> {

  const ObservableCreate(this.inlineObserve);

  final Observe<T> inlineObserve;

  @override
  Disposable observe(OnData<T> onData) {
    return _Observation<T>(
      configuration: this,
      emit: onData,
    );
  }
}

class _Observation<T> extends Observation<ObservableCreate<T>, T> implements Observer<T> {

  _Observation({
    required super.configuration, 
    required super.emit,
  });

  bool _disposed = false;
  late final Disposable _sourceObservation;

  @override
  void init() {
    _sourceObservation = configuration.inlineObserve(onData);
  }

  @override
  void onData(T data) {
    if (_disposed) {
      return;
    }
    emit(data);
  }

  @override
  void dispose() {
    if (_disposed) {
      return;
    }
    _disposed = true;
    _sourceObservation.dispose();
  }
}
