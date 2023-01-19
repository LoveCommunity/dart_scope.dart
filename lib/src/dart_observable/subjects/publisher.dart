
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'basic_subject.dart';
import 'subject.dart';

/// `Publisher` emits to an observer only those items that are emitted 
/// by the source Observable(s) subsequent to the time of the subscription.
///
/// Modified from: https://reactivex.io/documentation/subject.html
class Publisher<T> implements Subject<T> {

  bool _disposed = false;
  final _subject = BasicSubject<T>();

  @override
  Disposable observe(OnData<T> onData) {
    if (_disposed) {
      throw StateError("Subject is disposed and can't be observed.");
    }
    return _subject.observe(onData);
  }

  @override
  void onData(T data) {
    if (_disposed) {
      return;
    }
    _subject.onData(data);
  }

  @override
  void dispose() {
    if (_disposed) {
      return;
    }
    _disposed = true;
    _subject.dispose();
  }
}
