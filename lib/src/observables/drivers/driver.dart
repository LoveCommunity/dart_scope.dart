
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

  factory Driver.combine({
    required List<Driver<Object?>> children,
    required T Function(List<Object?> items) combiner,
  }) => Observable<T>.combine(
    children: children
      .map((driver) => driver.observable)
      .toList(),
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
