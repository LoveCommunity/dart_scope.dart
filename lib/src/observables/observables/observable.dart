
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'create_observable.dart';
import 'cast_observable.dart';
import 'combine_observable.dart';
import 'map_observable.dart';

typedef Observe<T> = Disposable Function(OnData<T> onData);

abstract class Observable<T> {

  Disposable observe(OnData<T> onData);

  const factory Observable(
    Observe<T> observe
  ) = CreateObservable;

  const factory Observable.combine({
    required List<Observable<Object?>> children,
    required T Function(List<Object?> items) combiner,
  }) = CombineObservable;
}


extension ObservableX<T> on Observable<T> {

  Observable<R> map<R>(R Function(T) convert) {
    return MapObservable<T, R>(
      convert: convert,
      child: this,
    );
  }

  Observable<R> cast<R>() {
    return CastObservable<T, R>(
      child: this,
    );
  }
}
