
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import 'observable.dart';
import 'observation.dart';
import '../observers/observer.dart';
import '../subjects/subject.dart';
import '../subjects/publisher.dart';

@internal
class ObservableMulticast<T> implements Observable<T> {

  ObservableMulticast({
    required this.createSubject,
    required this.source,
  }): shared = SharedBetweenObservations<T>();

  final Subject<T> Function()? createSubject;
  final Observable<T> source;

  final SharedBetweenObservations<T> shared;

  @override
  Disposable observe(OnData<T> onData) {
    return _Observation<T>(
      configuration: this,
      emit: onData,
    );
  }
}

Subject<T> _defaultCreateSubject<T>() {
  return Publisher<T>();
}

@internal
class SharedBetweenObservations<T> {
  int observersCount = 0;
  Subject<T>? subject;
  Disposable? observation;
}

class _Observation<T> extends Observation<ObservableMulticast<T>, T> {

  _Observation({
    required super.configuration, 
    required super.emit,
  });  

  late final Subject<T> Function() _createSubject = configuration.createSubject ?? _defaultCreateSubject;
  SharedBetweenObservations<T> get _shared => configuration.shared;

  bool _disposed = false;
  late final Disposable _subjectObservation;

  @override
  void init() {
    final subject = _shared.subject ??= _createSubject();
    _subjectObservation = subject.observe(emit);
    _shared.observersCount += 1;
    if (_shared.observersCount == 1) {
      _shared.observation = configuration.source.observe(subject.onData);
    }
  }

  @override
  void dispose() {
    if (_disposed) {
      return;
    }
    _disposed = true;
    final shouldDisposeSharedObservation = _shared.observersCount == 1;
    if (shouldDisposeSharedObservation) {
      _shared.observation?.dispose();
      _shared.observation = null;
    }
    _subjectObservation.dispose();
    _shared.observersCount -= 1;
    if (shouldDisposeSharedObservation) {
      _shared.subject?.dispose();
      _shared.subject = null;
    }
  }
}
