
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'basic_subject.dart';
import 'subject.dart';

class Variable<T> implements Subject<T> {

  Variable(
    T initialValue
  ): _value = initialValue;

  bool _disposed = false;
  final _subject = BasicSubject<T>();
  T _value;

  T get value {
    return _value;
  }

  set value(T value) {
    onData(value);
  }

  @override
  Disposable observe(OnData<T> onData) {
    if (_disposed) {
      throw StateError("Subject is disposed and can't be observed.");
    }
    onData(_value);
    return _subject.observe(onData);
  }

  @override
  void onData(T data) {
    if (_disposed) {
      return;
    }
    _value = data;
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
