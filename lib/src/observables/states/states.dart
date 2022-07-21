
import 'package:disposal/disposal.dart';
import 'package:typedef_equals/typedef_equals.dart';

import '../observers/observer.dart';
import '../observables/observable.dart';
import 'observable_as_states_x.dart';
import 'states_activated.dart';
import 'states_first.dart';

class States<T> {

  States(
    Observe<T> observe
  ): this.from(Observable(observe));

  static States<R> combine<T, R>({
    required List<States<T>> states,
    required R Function(List<T> items) combiner,
  }) => Observable.combine<T, R>(
    observables: states
      .map((states) => states.observable)
      .toList(),
    combiner: combiner,
  ).asStates();

  static States<R> combine2<T1, T2, R>({
    required States<T1> states1,
    required States<T2> states2,
    required R Function(T1, T2) combiner,
  }) => Observable.combine2<T1, T2, R>(
    observable1: states1.observable,
    observable2: states2.observable,
    combiner: combiner,
  ).asStates();

  static States<R> combine3<T1, T2, T3, R>({
    required States<T1> states1,
    required States<T2> states2,
    required States<T3> states3,
    required R Function(T1, T2, T3) combiner,
  }) => Observable.combine3<T1, T2, T3, R>(
    observable1: states1.observable,
    observable2: states2.observable,
    observable3: states3.observable,
    combiner: combiner,
  ).asStates();

  const States.from(this.observable);

  final Observable<T> observable;

  Disposable observe(OnData<T> onData) {
    return observable.observe(onData);
  }
}

extension StatesX<T> on States<T> {

  States<R> map<R>(R Function(T) convert) {
    return observable
      .map(convert)
      .asStates();
  }

  States<R> cast<R>() {
    return observable
      .cast<R>()
      .asStates();
  }

  States<T> distinct([Equals<T>? equals]) {
    return observable
      .distinct(equals)
      .asStates();
  }

  States<R> select<R>(
    R Function(T) convert, {
    Equals<R>? equals,
  }) {
    return observable
      .distinctMap<R>(
        convert,
        equals: equals,
      )
      .asStates();
  }

  States<T> cache() {
    return observable
      .multicastReplay(1)
      .asStates();
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
    return statesFirst(this);
  }

  StatesActivated<T> activated() {
    return StatesActivated<T>(
      states: this
    );
  }
}
