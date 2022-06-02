
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

  static Observable<R> combine2<T1, T2, R>({
    required Observable<T1> child1,
    required Observable<T2> child2,
    required R Function(T1, T2) combiner,
  }) => CombineObservable2(
    child1: child1,
    child2: child2,
    combiner: combiner,
  );

  static Observable<R> combine3<T1, T2, T3, R>({
    required Observable<T1> child1,
    required Observable<T2> child2,
    required Observable<T3> child3,
    required R Function(T1, T2, T3) combiner,
  }) => CombineObservable3(
    child1: child1,
    child2: child2,
    child3: child3,
    combiner: combiner,
  );
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
