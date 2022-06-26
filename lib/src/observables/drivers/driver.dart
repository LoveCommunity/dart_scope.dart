
import 'package:disposal/disposal.dart';
import 'package:typedef_equals/typedef_equals.dart';

import '../observers/observer.dart';
import '../observables/observable.dart';
import 'observable_as_driver_x.dart';
import 'driver_first.dart';

class Driver<T> {

  Driver(
    Observe<T> drive
  ): this.from(Observable(drive));

  static Driver<R> combine<T, R>({
    required List<Driver<T>> children,
    required R Function(List<T> items) combiner,
  }) => Observable.combine<T, R>(
    children: children
      .map((driver) => driver.observable)
      .toList(),
    combiner: combiner,
  ).asDriver();

  static Driver<R> combine2<T1, T2, R>({
    required Driver<T1> child1,
    required Driver<T2> child2,
    required R Function(T1, T2) combiner,
  }) => Observable.combine2<T1, T2, R>(
    child1: child1.observable,
    child2: child2.observable,
    combiner: combiner,
  ).asDriver();

  static Driver<R> combine3<T1, T2, T3, R>({
    required Driver<T1> child1,
    required Driver<T2> child2,
    required Driver<T3> child3,
    required R Function(T1, T2, T3) combiner,
  }) => Observable.combine3<T1, T2, T3, R>(
    child1: child1.observable,
    child2: child2.observable,
    child3: child3.observable,
    combiner: combiner,
  ).asDriver();

  const Driver.from(this.observable);

  final Observable<T> observable;

  Disposable drive(OnData<T> onData) {
    return observable.observe(onData);
  }
}

extension DriverX<T> on Driver<T> {

  Driver<R> map<R>(R Function(T) convert) {
    return observable
      .map(convert)
      .asDriver();
  }

  Driver<R> cast<R>() {
    return observable
      .cast<R>()
      .asDriver();
  }

  Driver<T> distinct([Equals<T>? equals]) {
    return observable
      .distinct(equals)
      .asDriver();
  }

  Driver<R> select<R>(
    R Function(T) convert, {
    Equals<R>? equals,
  }) {
    return observable
      .distinctMap<R>(
        convert,
        equals: equals,
      )
      .asDriver();
  }

  Driver<T> cache() {
    return observable
      .multicastReplay(1)
      .asDriver();
  }

  Observable<T> skip(int n) {
    return observable
      .skip(n);
  }

  Observable<T> skipFirst() {
    return observable
      .skip(1);
  }

  T get first {
    return driverFirst(this);
  }
}
