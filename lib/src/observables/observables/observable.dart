
import 'package:disposal/disposal.dart';
import 'package:typedef_equals/typedef_equals.dart';

import '../observers/observer.dart';
import '../subjects/subject.dart';
import '../subjects/replay_subject.dart';
import 'observable_create.dart';
import 'observable_cast.dart';
import 'observable_combine.dart';
import 'observable_distinct.dart';
import 'observable_map.dart';
import 'observable_multicast.dart';
import 'observable_skip.dart';
import 'observable_where.dart';

typedef Observe<T> = Disposable Function(OnData<T> onData);

abstract class Observable<T> {

  Disposable observe(OnData<T> onData);

  const factory Observable(
    Observe<T> observe
  ) = ObservableCreate;

  static Observable<R> combine<T, R>({
    required List<Observable<T>> children,
    required R Function(List<T> items) combiner,
  }) => ObservableCombine(
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
    return ObservableMap<T, R>(
      convert: convert,
      child: this,
    );
  }

  Observable<T> where(bool Function(T) test) {
    return ObservableWhere<T>(
      test: test,
      child: this,
    );
  }

  Observable<R> cast<R>() {
    return ObservableCast<T, R>(
      child: this,
    );
  }

  Observable<T> distinct([Equals<T>? equals]) {
    return ObservableDistinct<T>(
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
    return ObservableSkip(
      n: n,
      child: this,
    );
  }

  Observable<T> multicast({
    Subject<T> Function()? createSubject,
  }) {
    return ObservableMulticast<T>(
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
