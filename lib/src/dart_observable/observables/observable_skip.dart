
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import 'observable.dart';
import 'observation.dart';
import '../observers/observer.dart';

@internal
class ObservableSkip<T> implements Observable<T> {

  const ObservableSkip({
    required this.n,
    required this.source,
  });

  final int n;
  final Observable<T> source;

  @override
  Disposable observe(OnData<T> onData) {
    return _Observation<T>(
      configuration: this,
      emit: onData,
    );
  }
}

class _Observation<T> extends Observation<ObservableSkip<T>, T> implements Observer<T> {

  _Observation({
    required super.configuration, 
    required super.emit
  });

  late int _shouldSkip;
  late final Disposable _sourceObservation;

  @override
  void init() {
    _shouldSkip = configuration.n;
    _sourceObservation = configuration.source.observe(onData);
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
