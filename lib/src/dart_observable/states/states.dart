
import 'package:disposal/disposal.dart';
import 'package:typedef_equals/typedef_equals.dart';

import '../observers/observer.dart';
import '../observables/observable.dart';
import 'observable_as_states_x.dart';
import 'states_activated.dart';
import 'states_first.dart';

/// `States` is a sequence of state.
/// 
/// `States` is a variant of `Observable` promising to
/// replay current state to observer synchronously when observed.
/// 
/// Example:
/// 
/// ```dart
/// final states = States<int>((setState) {
///   setState(0); // promising set current state synchronously
/// 
///   // then can set following state asynchronously or synchronously
///   Future(() => setState(1));
/// 
///   return Disposable.empty;
/// });
/// 
/// late int currentState;
/// final observation = states.observe((state) {
///   currentState = state;
/// });
/// print(currentState); // 0
/// ```
/// 
/// Above `currentState` is guarantee to be initialized after 
/// calling `states.observe`, since `States` promising this behavior.
/// 
class States<T> {

  /// Use `States(...)` to create a sequence of state with
  /// an inline `observe` method `(setState) { ... }`.
  /// 
  /// ```dart
  /// final states = States<int>((setState) {
  ///   setState(0);
  ///   setState(1);
  ///   setState(2);
  ///   return Disposable.empty;
  /// });
  /// ```
  /// 
  factory States(
    Observe<T> observe
  ) => Observable(observe)
    .asStates();

  /// Combine multiple `States` into one `States`.
  /// 
  /// When an item is emitted by one of multiple States, 
  /// combine the latest item emitted by each States 
  /// via a specified function and emit combined item that changed.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static States<R> computed<T, R>({
    required List<States<T>> states,
    required R Function(List<T> items) compute,
    Equals<R>? equals,
  }) => Observable.combine<T, R>(
    sources: states
      .map((states) => states.observable)
      .toList(),
    combiner: compute,
  ).distinct(equals)
  .asStates();

  /// Combine two `States` into one `States`.
  /// 
  /// When an item is emitted by one of two States, 
  /// combine the latest item emitted by each States 
  /// via a specified function and emit combined item that changed.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static States<R> computed2<T1, T2, R>({
    required States<T1> states1,
    required States<T2> states2,
    required R Function(T1, T2) compute,
    Equals<R>? equals,
  }) => Observable.combine2<T1, T2, R>(
    source1: states1.observable,
    source2: states2.observable,
    combiner: compute,
  ).distinct(equals)
  .asStates();

  /// Combine three `States` into one `States`.
  /// 
  /// When an item is emitted by one of three States, 
  /// combine the latest item emitted by each States 
  /// via a specified function and emit combined item that changed.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static States<R> computed3<T1, T2, T3, R>({
    required States<T1> states1,
    required States<T2> states2,
    required States<T3> states3,
    required R Function(T1, T2, T3) compute,
    Equals<R>? equals,
  }) => Observable.combine3<T1, T2, T3, R>(
    source1: states1.observable,
    source2: states2.observable,
    source3: states3.observable,
    combiner: compute,
  ).distinct(equals)
  .asStates();

  /// Combine four `States` into one `States`.
  /// 
  /// When an item is emitted by one of four States, 
  /// combine the latest item emitted by each States 
  /// via a specified function and emit combined item that changed.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static States<R> computed4<T1, T2, T3, T4, R>({
    required States<T1> states1,
    required States<T2> states2,
    required States<T3> states3,
    required States<T4> states4,
    required R Function(T1, T2, T3, T4) compute,
    Equals<R>? equals,
  }) => Observable.combine4<T1, T2, T3, T4, R>(
    source1: states1.observable,
    source2: states2.observable,
    source3: states3.observable,
    source4: states4.observable,
    combiner: compute,
  ).distinct(equals)
  .asStates();

  /// Combine five `States` into one `States`.
  /// 
  /// When an item is emitted by one of five States, 
  /// combine the latest item emitted by each States 
  /// via a specified function and emit combined item that changed.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static States<R> computed5<T1, T2, T3, T4, T5, R>({
    required States<T1> states1,
    required States<T2> states2,
    required States<T3> states3,
    required States<T4> states4,
    required States<T5> states5,
    required R Function(T1, T2, T3, T4, T5) compute,
    Equals<R>? equals,
  }) => Observable.combine5<T1, T2, T3, T4, T5, R>(
    source1: states1.observable,
    source2: states2.observable,
    source3: states3.observable,
    source4: states4.observable,
    source5: states5.observable,
    combiner: compute,
  ).distinct(equals)
  .asStates();

  /// Combine six `States` into one `States`.
  /// 
  /// When an item is emitted by one of six States, 
  /// combine the latest item emitted by each States 
  /// via a specified function and emit combined item that changed.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static States<R> computed6<T1, T2, T3, T4, T5, T6, R>({
    required States<T1> states1,
    required States<T2> states2,
    required States<T3> states3,
    required States<T4> states4,
    required States<T5> states5,
    required States<T6> states6,
    required R Function(T1, T2, T3, T4, T5, T6) compute,
    Equals<R>? equals,
  }) => Observable.combine6<T1, T2, T3, T4, T5, T6, R>(
    source1: states1.observable,
    source2: states2.observable,
    source3: states3.observable,
    source4: states4.observable,
    source5: states5.observable,
    source6: states6.observable,
    combiner: compute,
  ).distinct(equals)
  .asStates();

  /// Combine seven `States` into one `States`.
  /// 
  /// When an item is emitted by one of seven States, 
  /// combine the latest item emitted by each States 
  /// via a specified function and emit combined item that changed.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static States<R> computed7<T1, T2, T3, T4, T5, T6, T7, R>({
    required States<T1> states1,
    required States<T2> states2,
    required States<T3> states3,
    required States<T4> states4,
    required States<T5> states5,
    required States<T6> states6,
    required States<T7> states7,
    required R Function(T1, T2, T3, T4, T5, T6, T7) compute,
    Equals<R>? equals,
  }) => Observable.combine7<T1, T2, T3, T4, T5, T6, T7, R>(
    source1: states1.observable,
    source2: states2.observable,
    source3: states3.observable,
    source4: states4.observable,
    source5: states5.observable,
    source6: states6.observable,
    source7: states7.observable,
    combiner: compute,
  ).distinct(equals)
  .asStates();

  /// Combine eight `States` into one `States`.
  /// 
  /// When an item is emitted by one of eight States, 
  /// combine the latest item emitted by each States 
  /// via a specified function and emit combined item that changed.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static States<R> computed8<T1, T2, T3, T4, T5, T6, T7, T8, R>({
    required States<T1> states1,
    required States<T2> states2,
    required States<T3> states3,
    required States<T4> states4,
    required States<T5> states5,
    required States<T6> states6,
    required States<T7> states7,
    required States<T8> states8,
    required R Function(T1, T2, T3, T4, T5, T6, T7, T8) compute,
    Equals<R>? equals,
  }) => Observable.combine8<T1, T2, T3, T4, T5, T6, T7, T8, R>(
    source1: states1.observable,
    source2: states2.observable,
    source3: states3.observable,
    source4: states4.observable,
    source5: states5.observable,
    source6: states6.observable,
    source7: states7.observable,
    source8: states8.observable,
    combiner: compute,
  ).distinct(equals)
  .asStates();

  /// Combine nine `States` into one `States`.
  /// 
  /// When an item is emitted by one of nine States, 
  /// combine the latest item emitted by each States 
  /// via a specified function and emit combined item that changed.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static States<R> computed9<T1, T2, T3, T4, T5, T6, T7, T8, T9, R>({
    required States<T1> states1,
    required States<T2> states2,
    required States<T3> states3,
    required States<T4> states4,
    required States<T5> states5,
    required States<T6> states6,
    required States<T7> states7,
    required States<T8> states8,
    required States<T9> states9,
    required R Function(T1, T2, T3, T4, T5, T6, T7, T8, T9) compute,
    Equals<R>? equals,
  }) => Observable.combine9<T1, T2, T3, T4, T5, T6, T7, T8, T9, R>(
    source1: states1.observable,
    source2: states2.observable,
    source3: states3.observable,
    source4: states4.observable,
    source5: states5.observable,
    source6: states6.observable,
    source7: states7.observable,
    source8: states8.observable,
    source9: states9.observable,
    combiner: compute,
  )
  .distinct(equals)
  .asStates();

  /// Create `States` from raw `Observable`.
  const States.from(this.observable);

  /// The underlining raw `observable` that is promised to 
  /// replay current state synchronously when observed.
  final Observable<T> observable;

  /// Use `states.observe` to start observe `states`,
  /// use returned `observation` to stop observe.
  /// 
  /// ```dart
  /// // start observe
  /// final observation = states.observe((state) {
  ///   print('onState: $state');
  /// });
  /// 
  /// // stop observe
  /// observation.dispose();
  /// ```
  /// 
  Disposable observe(OnData<T> onData) {
    return observable.observe(onData);
  }
}

/// `StatesX` is an extension on `States` that
/// adds common used operators like `map`, `cast`, etc.
extension StatesX<T> on States<T> {

  /// Transform the items emitted by States by 
  /// applying a function to each item.
  /// 
  /// The Map operator applies a function of your choosing 
  /// to each item emitted by the source States,
  /// and returns States that emits the results of 
  /// these function applications.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/map.html
  States<R> map<R>(R Function(T) convert) {
    return observable
      .map(convert)
      .asStates();
  }

  /// Mapping source `States<T>` to `States<R>`
  /// by casting each item as `R`.
  States<R> cast<R>() {
    return observable
      .cast<R>()
      .asStates();
  }

  /// Mirror an States and emit only those items that changed
  /// (meaning item is distinct from previous emitted one).
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/distinct.html
  States<T> distinct([Equals<T>? equals]) {
    return observable
      .distinct(equals)
      .asStates();
  }

  /// `Convert` each item by applying a function and only emit result that 
  /// changed.
  /// 
  /// `Convert` is composition of `Map` and `Distinct`.
  /// 
  /// It first transform the items emitted by applying a function, 
  /// then only emit result that is distinct from previous emitted result.
  /// 
  States<R> convert<R>(
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

  /// Suppress the first n items emitted by States.
  /// 
  /// You can ignore the first n items emitted by States 
  /// and attend only to those items that come after, 
  /// by modifying the States with the Skip operator.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/skip.html
  Observable<T> skip(int n) {
    return observable
      .skip(n);
  }

  /// Suppress the first item emitted by States.
  /// 
  /// You can ignore the first item emitted by States 
  /// and attend only to those items that come after, 
  /// by modifying the States with the SkipFirst operator.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/skip.html
  Observable<T> skipFirst() {
    return observable
      .skip(1);
  }

  /// Get the first item of states.
  /// 
  /// This getter is often used to get current state:
  /// 
  /// ```dart
  /// final States<int> states = ...;
  /// final int currentState = states.first;
  /// ```
  /// 
  T get first {
    return statesFirst(this);
  }

  StatesActivated<T> activated() {
    return StatesActivated<T>(
      states: this
    );
  }
}
