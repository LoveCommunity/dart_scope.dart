
import 'dart:collection';
import 'package:disposal/disposal.dart';

import '../../shared/value.dart';
import '../observers/observer.dart';
import 'basic_subject.dart';
import 'subject.dart';

class ReplaySubject<T> implements Subject<T> {

  ReplaySubject({
    required int bufferSize
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


