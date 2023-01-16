
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'basic_subject.dart';
import 'subject.dart';

/// `Variable` hold value that can be changed. Value could be 
/// resolved once or continuously.
/// 
/// Resolve value once using `variable.value` getter:
/// ```dart
/// final variable = Variable(0);
/// print(variable.value) // 0
/// variable.value = 1;
/// print(variable.value) // 1
/// ```
/// 
/// Resolve value continuously using `variable.observe`:
/// ```dart
/// final variable = Variable(0);
/// final observation = variable.observe((data) {
///   print('onData: $data');
/// });
/// variable.value = 1;
/// ```
/// 
/// prints:
/// 
/// ```
/// onData: 0
/// onData: 1
/// ```
/// 
class Variable<T> implements Subject<T> {

  /// Use `Variable(...)` to create a variable with an initial value.
  Variable(
    T initialValue
  ): _value = initialValue;

  bool _disposed = false;
  final _subject = BasicSubject<T>();
  T _value;

  /// Use `variable.value` getter  to resolve current value.
  T get value {
    return _value;
  }

  /// Use `variable.value = ...` to change current value.
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
