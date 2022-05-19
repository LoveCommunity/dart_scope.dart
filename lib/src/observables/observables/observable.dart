
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';

typedef Observe<T> = Disposable Function(OnData<T> onData);

abstract class Observable<T> {

  Disposable observe(OnData<T> onData);
}
