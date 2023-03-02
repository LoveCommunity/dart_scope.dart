
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
    Subject<T> Function()? createSubject,
    required Observable<T> source,
  }): _createSubject = createSubject ?? _defaultCreateSubject,
    _source = source,
    _shared = _SharedBetweenObservations<T>();

  final Subject<T> Function() _createSubject;
  final Observable<T> _source;

  final _SharedBetweenObservations<T> _shared;

  @override
  Disposable observe(OnData<T> onData) {
    return _Observation<T>(
      createSubject: _createSubject,
      source: _source,
      shared: _shared,
      emit: onData,
    );
  }
}

Subject<T> _defaultCreateSubject<T>() {
  return Publisher<T>();
}

class _SharedBetweenObservations<T> {
  int observersCount = 0;
  Subject<T>? subject;
  Disposable? observation;
}

class _Observation<T> extends Observation<T> {

  _Observation({
    required Subject<T> Function() createSubject,
    required Observable<T> source,
    required _SharedBetweenObservations<T> shared,
    required super.emit,
  }): _createSubject = createSubject,
    _source = source,
    _shared = shared;

  final Subject<T> Function() _createSubject;
  final Observable<T> _source;

  final _SharedBetweenObservations<T> _shared;

  bool _disposed = false;
  late final Disposable _subjectObservation;

  @override
  void init() {
    final subject = _shared.subject ??= _createSubject();
    _subjectObservation = subject.observe(emit);
    _shared.observersCount += 1;
    if (_shared.observersCount == 1) {
      _shared.observation = _source.observe(subject.onData);
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
