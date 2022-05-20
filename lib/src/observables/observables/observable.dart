
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'create_observable.dart';

typedef Observe<T> = Disposable Function(OnData<T> onData);

abstract class Observable<T> {

  Disposable observe(OnData<T> onData);

  const factory Observable(
    Observe<T> observe
  ) = CreateObservable;
}
