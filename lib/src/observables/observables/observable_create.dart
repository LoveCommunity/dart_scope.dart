
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import 'observable.dart';
import '../observers/observer.dart';

@internal
class ObservableCreate<T> implements Observable<T> {

  const ObservableCreate(this._observe);

  final Observe<T> _observe;

  @override
  Disposable observe(OnData<T> onData) {
    bool disposed = false;

    final observation = _observe((data) {
      if (disposed) {
        return;
      }
      onData(data);
    });

    return Disposable(() {
      if (disposed) {
        return;
      }
      disposed = true;
      observation.dispose();
    });
  }
}
