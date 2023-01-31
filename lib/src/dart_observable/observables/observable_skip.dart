
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import 'observable.dart';
import 'observation.dart';
import '../observers/observer.dart';

@internal
class ObservableSkip<T> implements Observable<T> {

  const ObservableSkip({
    required int n,
    required Observable<T> observable,
  }): _n = n,
    _observable = observable;

  final int _n;
  final Observable<T> _observable;

  @override
  Disposable observe(OnData<T> onData) {
    return _Observation<T>(
      n: _n,
      observable: _observable,
      emit: onData,
    );
  }
}

class _Observation<T> extends Observation<T> implements Observer<T> {

  _Observation({
    required int n,
    required Observable<T> observable,
    required OnData<T> emit,
  }): _shouldSkip = n,
    _observable = observable,
    super(emit: emit);

  final Observable<T> _observable;

  int _shouldSkip;
  late final Disposable _sourceObservation;

  @override
  void init() {
    _sourceObservation = _observable.observe(onData);
  }

  @override
  void onData(T data) {
    if (_shouldSkip > 0) {
      _shouldSkip -= 1;
    } else {
      emit(data);
    }
  }

  @override
  void dispose() {
    _sourceObservation.dispose();
  }
}
