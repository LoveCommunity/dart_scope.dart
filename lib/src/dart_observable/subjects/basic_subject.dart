
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'subject.dart';

@internal
class BasicSubject<T> implements Subject<T> {

  final _idGenerator = _SerialNumberGenerator();
  final Map<int, OnData<T>> _map = {};

  @override
  Disposable observe(OnData<T> onData) {
    final id = _idGenerator.generate();
    _map[id] = onData;
    return Disposable(() {
      _map.remove(id);
    });
  }

  @override
  void onData(T data) {
    if (_map.isEmpty) {
      return;
    }
    for (final onData in _map.values.toList()) {
      onData(data);
    }
  }

  @override
  void dispose() {
    _map.clear();
  }
}

class _SerialNumberGenerator {
  int? _last;

  int generate() {
    final it = _last == null ? 0 : _last! + 1;
    _last = it;
    return it;
  }
}
