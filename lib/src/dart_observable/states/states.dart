
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
  /// via a specified function and emit combined item.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static States<R> combine<T, R>({
    required List<States<T>> states,
    required R Function(List<T> items) combiner,
  }) => Observable.combine<T, R>(
    sources: states
      .map((states) => states.observable)
      .toList(),
    combiner: combiner,
  ).asStates();

  /// Combine two `States` into one `States`.
  /// 
  /// When an item is emitted by one of two States, 
  /// combine the latest item emitted by each States 
  /// via a specified function and emit combined item.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static States<R> combine2<T1, T2, R>({
    required States<T1> states1,
    required States<T2> states2,
    required R Function(T1, T2) combiner,
  }) => Observable.combine2<T1, T2, R>(
    source1: states1.observable,
    source2: states2.observable,
    combiner: combiner,
  ).asStates();

  /// Combine three `States` into one `States`.
  /// 
  /// When an item is emitted by one of three States, 
  /// combine the latest item emitted by each States 
  /// via a specified function and emit combined item.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static States<R> combine3<T1, T2, T3, R>({
    required States<T1> states1,
    required States<T2> states2,
    required States<T3> states3,
    required R Function(T1, T2, T3) combiner,
  }) => Observable.combine3<T1, T2, T3, R>(
    source1: states1.observable,
    source2: states2.observable,
    source3: states3.observable,
    combiner: combiner,
  ).asStates();

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
