
import 'package:meta/meta.dart';

import 'observer.dart';

@internal
class ObserverFunction<T> implements Observer<T> {
  
  const ObserverFunction(this._onData);

  final OnData<T> _onData;

  @override
  void onData(T data) {
    _onData(data);
  }
}
