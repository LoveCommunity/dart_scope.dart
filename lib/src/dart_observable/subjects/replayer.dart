
import 'dart:collection';
import 'package:disposal/disposal.dart';

import '../../shared/value.dart';
import '../observers/observer.dart';
import 'basic_subject.dart';
import 'subject.dart';

/// `Replayer` first replays items to an observer that are emitted 
/// by the source Observable(s) and then forward upcoming items to 
/// this observer.
class Replayer<T> implements Subject<T> {
  
  /// Use `Replayer(...)` to create a subject that replay items 
  /// already emitted to observer, also forward upcoming items
  /// to observer.
  /// 
  /// Use `bufferSize` to specific how many items to replay:
  /// 
  /// ```dart
  /// final replayer = Replayer<int>(bufferSize: 3);
  /// replayer.onData(1);
  /// replayer.onData(2);
  /// replayer.onData(3);
  /// replayer.onData(4);
  /// replayer.onData(5);
  /// replayer.onData(6);
  /// 
  /// final observation = replayer.observe((data) {
  ///   print('onData: $data');
  /// });
  /// ```
  /// 
  /// prints:
  /// 
  /// ```
  /// onData: 4
  /// onData: 5
  /// onData: 6
  /// ```
  /// 
  /// The `bufferSize` is set to 3, so latest 3 items has been
  /// replayed. 
  /// 
  /// Items emitted after observation will also be forward 
  /// to observer:
  /// 
  /// ```dart
  /// /// Continuing with the example
  ///                     
  ///                     //  prints:
  /// replayer.onData(7); //    onData: 7  
  /// replayer.onData(8); //    onData: 8  
  /// replayer.onData(9); //    onData: 9
  /// ```
  /// 
  Replayer({
    required int bufferSize,
  }): _buffer = bufferSize == 1
        ? _SingleElementBuffer<T>()
        : _MultiElementBuffer<T>(size: bufferSize);

  final _Buffer<T> _buffer;
  bool _disposed = false;
  final _subject = BasicSubject<T>();

  @override
  Disposable observe(OnData<T> onData) {
    if (_disposed) {
      throw StateError("Subject is disposed and can't be observed.");
    }
    _buffer.forEach(onData);
    return _subject.observe(onData);
  }

  @override
  void onData(T data) {
    if (_disposed) {
      return;
    }
    _buffer.add(data);
    _subject.onData(data);
  }

  @override
  void dispose() {
    if (_disposed) {
      return;
    }
    _disposed = true;
    _subject.dispose();
    _buffer.dispose();
  }
}

abstract class _Buffer<T> implements Disposable {

  void add(T data);

  void forEach(OnData<T> onData);
}

class _SingleElementBuffer<T> implements _Buffer<T> {

  Value<T>? _data;

  @override
  void add(T data) {
    _data = Value(data);
  }

  @override
  void forEach(OnData<T> onData) {
    if (_data != null) {
      onData(_data!.value);
    }
  }

  @override
  void dispose() {
    _data = null;
  }
}

class _MultiElementBuffer<T> implements _Buffer<T> {

  _MultiElementBuffer({
    required int size,
  }): _size = size;

  final int _size;
  final _queue = Queue<T>();

  @override
  void add(T data) {
    _queue.add(data);
    if (_queue.length > _size) {
      _queue.removeFirst();
    }
  }

  @override
  void forEach(OnData<T> onData) {
    for (final data in _queue) {
      onData(data);
    }
  }

  @override
  void dispose() {
    _queue.clear();
  }
}


