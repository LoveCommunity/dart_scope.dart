
import 'package:disposal/disposal.dart';
import 'package:typedef_equals/typedef_equals.dart';

import '../observers/observer.dart';
import '../subjects/subject.dart';
import '../subjects/replay_subject.dart';
import 'create_observable.dart';
import 'cast_observable.dart';
import 'combine_observable.dart';
import 'distinct_observable.dart';
import 'map_observable.dart';
import 'multicast_observable.dart';
import 'skip_observable.dart';
import 'where_observable.dart';

typedef Observe<T> = Disposable Function(OnData<T> onData);

abstract class Observable<T> {

  Disposable observe(OnData<T> onData);

  const factory Observable(
    Observe<T> observe
  ) = CreateObservable;

  static Observable<R> combine<T, R>({
    required List<Observable<T>> children,
    required R Function(List<T> items) combiner,
  }) => CombineObservable(
    children: children,
    combiner: combiner,
  );

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

  Observable<T> where(bool Function(T) test) {
    return WhereObservable<T>(
      test: test,
      child: this,
    );
  }

  Observable<R> cast<R>() {
    return CastObservable<T, R>(
      child: this,
    );
  }

  Observable<T> distinct([Equals<T>? equals]) {
    return DistinctObservable<T>(
      equals: equals,
      child: this,
    );
  }

  Observable<R> distinctMap<R>(
    R Function(T) convert, {
    Equals<R>? equals,
  }) => map(convert)
    .distinct(equals);

  Observable<T> skip(int n) {
    return SkipObservable(
      n: n,
      child: this,
    );
  }

  Observable<T> multicast({
    Subject<T> Function()? createSubject,
  }) {
    return MulticastObservable<T>(
      createSubject: createSubject,
      child: this,
    );
  }

  Observable<T> multicastReplay(int bufferSize) {
    return multicast(
      createSubject: () => ReplaySubject<T>(
        bufferSize: bufferSize
      ),
    );
  }

}
