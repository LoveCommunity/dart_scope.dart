
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'base_observable.dart';
import 'observation.dart';

@internal
class ObservableSkip<T> extends PipeObservable<T, T> {

  const ObservableSkip({
    required this.n,
    required super.source,
  });

  final int n;

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
