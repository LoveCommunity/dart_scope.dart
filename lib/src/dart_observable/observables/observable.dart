
import 'package:disposal/disposal.dart';
import 'package:typedef_equals/typedef_equals.dart';

import '../observers/observer.dart';
import '../subjects/subject.dart';
import '../subjects/replayer.dart';
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
    required List<Observable<T>> observables,
    required R Function(List<T> items) combiner,
  }) => ObservableCombine(
    observables: observables,
    combiner: combiner,
  );

  static Observable<R> combine2<T1, T2, R>({
    required Observable<T1> observable1,
    required Observable<T2> observable2,
    required R Function(T1, T2) combiner,
  }) => CombineObservable2(
    observable1: observable1,
    observable2: observable2,
    combiner: combiner,
  );

  static Observable<R> combine3<T1, T2, T3, R>({
    required Observable<T1> observable1,
    required Observable<T2> observable2,
    required Observable<T3> observable3,
    required R Function(T1, T2, T3) combiner,
  }) => CombineObservable3(
    observable1: observable1,
    observable2: observable2,
    observable3: observable3,
    combiner: combiner,
  );
}


extension ObservableX<T> on Observable<T> {

  Observable<R> map<R>(R Function(T) convert) {
    return ObservableMap<T, R>(
      convert: convert,
      observable: this,
    );
  }

  Observable<T> where(bool Function(T) test) {
    return ObservableWhere<T>(
      test: test,
      observable: this,
    );
  }

  Observable<R> cast<R>() {
    return ObservableCast<T, R>(
      observable: this,
    );
  }

  Observable<T> distinct([Equals<T>? equals]) {
    return ObservableDistinct<T>(
      equals: equals,
      observable: this,
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
      observable: this,
    );
  }

  Observable<T> multicast({
    Subject<T> Function()? createSubject,
  }) {
    return ObservableMulticast<T>(
      createSubject: createSubject,
      observable: this,
    );
  }

  Observable<T> multicastReplay(int bufferSize) {
    return multicast(
      createSubject: () => Replayer<T>(
        bufferSize: bufferSize
      ),
    );
  }

}
