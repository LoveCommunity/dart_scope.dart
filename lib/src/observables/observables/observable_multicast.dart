
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import 'observable.dart';
import '../observers/observer.dart';
import '../subjects/subject.dart';
import '../subjects/publish_subject.dart';

@internal
class ObservableMulticast<T> implements Observable<T> {

  ObservableMulticast({
    Subject<T> Function()? createSubject,
    required Observable<T> observable,
  }): _createSubject = createSubject ?? _defaultCreateSubject,
    _observable = observable;

  final Subject<T> Function() _createSubject;
  final Observable<T> _observable;

  int _observationsLength = 0;
  Subject<T>? _subject;
  Disposable? _connection;

  @override
  Disposable observe(OnData<T> onData) {
    bool disposed = false;
    final subject = _subject ??= _createSubject();
    final observation = subject.observe(onData);
    _observationsLength += 1;
    if (_observationsLength == 1) {
      _connection = _observable.observe(subject.onData);
    }
    return Disposable(() {
      if (disposed) {
        return;
      }
      disposed = true;
      observation.dispose();
      _observationsLength -= 1;
      if (_observationsLength == 0) {
        _connection?.dispose();
        _connection = null;
        _subject?.dispose();
        _subject = null;
      }
    });
  }
}

Subject<T> _defaultCreateSubject<T>() {
  return PublishSubject<T>();
}
