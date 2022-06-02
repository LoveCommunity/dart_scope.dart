import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'observable.dart';

class ProxyObservable<T> implements Observable<T> {

  const ProxyObservable({
    required Observable<T> proxy,
  }): _proxy = proxy;

  final Observable<T> _proxy;

  @override
  Disposable observe(OnData<T> onData) {
    return _proxy.observe(onData);
  }
}
