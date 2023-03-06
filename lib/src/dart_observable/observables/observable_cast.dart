
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'base_observable.dart';

@internal
class ObservableCast<T, R> extends PipeObservable<T, R> {

  const ObservableCast({
    required super.source,
  });

  @override
  Disposable observe(OnData<R> onData) {
    return source.observe((data) {
      onData(data as R);
    });
  }
}
