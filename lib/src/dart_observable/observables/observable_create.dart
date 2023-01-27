
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import 'observable.dart';
import 'observation.dart';
import '../observers/observer.dart';

@internal
class ObservableCreate<T> implements Observable<T> {

  const ObservableCreate(this._observe);

  final Observe<T> _observe;

  @override
  Disposable observe(OnData<T> onData) {
    return _Observation<T>(
      observe: _observe,
      emit: onData,
    );
  }
}

class _Observation<T> extends Observation<T> implements Observer<T> {

  _Observation({
    required Observe<T> observe,
    required OnData<T> emit,
  }): _observe = observe,
    super(emit: emit);

  final Observe<T> _observe;

  bool _disposed = false;
  late final Disposable _sourceObservation;

  @override
  void init() {
    _sourceObservation = _observe(onData);
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
