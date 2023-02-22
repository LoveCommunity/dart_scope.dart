
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'base_observable.dart';
import 'observable.dart';
import 'observation.dart';

@internal
class ObservableSkip<T> extends PipeObservable<T, T> {

  const ObservableSkip({
    required int n,
    required Observable<T> observable,
  }): _n = n,
    super(observable: observable);

  final int _n;

  @override
  Disposable observe(OnData<T> onData) {
    return _Observation<T>(
      n: _n,
      observable: observable,
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
