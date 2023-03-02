
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import 'observable.dart';
import 'observation.dart';
import '../observers/observer.dart';

@internal
class ObservableSkip<T> implements Observable<T> {

  const ObservableSkip({
    required int n,
    required Observable<T> source,
  }): _n = n,
    _source = source;

  final int _n;
  final Observable<T> _source;

  @override
  Disposable observe(OnData<T> onData) {
    return _Observation<T>(
      n: _n,
      source: _source,
      emit: onData,
    );
  }
}

class _Observation<T> extends Observation<T> implements Observer<T> {

  _Observation({
    required int n,
    required Observable<T> source,
    required super.emit,
  }): _shouldSkip = n,
    _source = source;

  final Observable<T> _source;

  int _shouldSkip;
  late final Disposable _sourceObservation;

  @override
  void init() {
    _sourceObservation = _source.observe(onData);
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
