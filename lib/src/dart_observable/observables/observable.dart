
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

/// `Observe` is a function describe how to emit data.
/// 
/// ```dart
/// final Observe<int> observe = (onData) {
///   onData(0);
///   onData(1);
///   onData(2);
///   return Disposable.empty;
/// };
/// ```
typedef Observe<T> = Disposable Function(OnData<T> onData);

/// `Observable` is a sequence of data that can be emitted 
/// synchronously or asynchronously.
/// 
/// Technical speaking, `Observable` is an interface that
/// has an `observe` method:
/// 
/// ```dart
/// abstract class Observable<T> {
///   Disposable observe(OnData<T> onData);
/// }
/// ```
/// 
/// Example:
/// 
/// ```dart
/// final observable = Observable<int>((onData) {
///   onData(0);
///   onData(1);
///   onData(2);
///   return Disposable.empty;
/// });
/// ```
/// 
/// Above example create an `Observable` using inline `observe`
/// method `(onData) { ... }`. It will emit data synchronously 
/// when observed:
/// 
/// ```dart
/// print('before observe');
/// 
/// final observation = observable.observe((data) {
///   print('onData: $data');
/// });
/// 
/// print('after observe');
/// ```
/// 
/// Prints:
/// 
/// ```dart
/// before observe
/// onData: 0
/// onData: 1
/// onData: 2
/// after observe
/// ```
/// 
abstract class Observable<T> {

  /// Use `observable.observe` to start observe an observable,
  /// use returned `observation` to stop observe.
  /// 
  /// ```dart
  /// // start observe
  /// final observation = observable.observe((data) {
  ///   print('onData: $data');
  /// });
  /// 
  /// // stop observe
  /// observation.dispose();
  /// ```
  /// 
  Disposable observe(OnData<T> onData);

  /// Use `Observable(...)` to create an `Observable` with
  /// an inline `observe` method `(onData) { ... }`.
  /// 
  /// ```dart
  /// final observable = Observable<int>((onData) {
  ///   onData(0);
  ///   onData(1);
  ///   onData(2);
  ///   return Disposable.empty;
  /// });
  /// ```
  /// 
  const factory Observable(
    Observe<T> inlineObserve
  ) = ObservableCreate;
  
  /// Combine multiple `Observable` into one `Observable`.
  /// 
  /// When an item is emitted by one of multiple Observables, 
  /// combine the latest item emitted by each Observable 
  /// via a specified function and emit combined item.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static Observable<R> combine<T, R>({
    required List<Observable<T>> sources,
    required R Function(List<T> items) combiner,
  }) => ObservableCombine(
    sources: sources,
    combiner: combiner,
  );

  /// Combine two `Observable` into one `Observable`.
  /// 
  /// When an item is emitted by one of two Observables, 
  /// combine the latest item emitted by each Observable 
  /// via a specified function and emit combined item.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static Observable<R> combine2<T1, T2, R>({
    required Observable<T1> source1,
    required Observable<T2> source2,
    required R Function(T1, T2) combiner,
  }) => CombineObservable2(
    source1: source1,
    source2: source2,
    combiner: combiner,
  );

  /// Combine three `Observable` into one `Observable`.
  /// 
  /// When an item is emitted by one of three Observables, 
  /// combine the latest item emitted by each Observable 
  /// via a specified function and emit combined item.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static Observable<R> combine3<T1, T2, T3, R>({
    required Observable<T1> source1,
    required Observable<T2> source2,
    required Observable<T3> source3,
    required R Function(T1, T2, T3) combiner,
  }) => CombineObservable3(
    source1: source1,
    source2: source2,
    source3: source3,
    combiner: combiner,
  );

  /// Combine four `Observable` into one `Observable`.
  /// 
  /// When an item is emitted by one of four Observables, 
  /// combine the latest item emitted by each Observable 
  /// via a specified function and emit combined item.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static Observable<R> combine4<T1, T2, T3, T4, R>({
    required Observable<T1> source1,
    required Observable<T2> source2,
    required Observable<T3> source3,
    required Observable<T4> source4,
    required R Function(T1, T2, T3, T4) combiner,
  }) => CombineObservable4(
    source1: source1,
    source2: source2,
    source3: source3,
    source4: source4,
    combiner: combiner,
  );

  /// Combine five `Observable` into one `Observable`.
  /// 
  /// When an item is emitted by one of five Observables, 
  /// combine the latest item emitted by each Observable 
  /// via a specified function and emit combined item.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static Observable<R> combine5<T1, T2, T3, T4, T5, R>({
    required Observable<T1> source1,
    required Observable<T2> source2,
    required Observable<T3> source3,
    required Observable<T4> source4,
    required Observable<T5> source5,
    required R Function(T1, T2, T3, T4, T5) combiner,
  }) => CombineObservable5(
    source1: source1,
    source2: source2,
    source3: source3,
    source4: source4,
    source5: source5,
    combiner: combiner,
  );

  /// Combine six `Observable` into one `Observable`.
  /// 
  /// When an item is emitted by one of six Observables, 
  /// combine the latest item emitted by each Observable 
  /// via a specified function and emit combined item.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static Observable<R> combine6<T1, T2, T3, T4, T5, T6, R>({
    required Observable<T1> source1,
    required Observable<T2> source2,
    required Observable<T3> source3,
    required Observable<T4> source4,
    required Observable<T5> source5,
    required Observable<T6> source6,
    required R Function(T1, T2, T3, T4, T5, T6) combiner,
  }) => CombineObservable6(
    source1: source1,
    source2: source2,
    source3: source3,
    source4: source4,
    source5: source5,
    source6: source6,
    combiner: combiner,
  );

  /// Combine seven `Observable` into one `Observable`.
  /// 
  /// When an item is emitted by one of seven Observables, 
  /// combine the latest item emitted by each Observable 
  /// via a specified function and emit combined item.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static Observable<R> combine7<T1, T2, T3, T4, T5, T6, T7, R>({
    required Observable<T1> source1,
    required Observable<T2> source2,
    required Observable<T3> source3,
    required Observable<T4> source4,
    required Observable<T5> source5,
    required Observable<T6> source6,
    required Observable<T7> source7,
    required R Function(T1, T2, T3, T4, T5, T6, T7) combiner,
  }) => CombineObservable7(
    source1: source1,
    source2: source2,
    source3: source3,
    source4: source4,
    source5: source5,
    source6: source6,
    source7: source7,
    combiner: combiner,
  );

  /// Combine eight `Observable` into one `Observable`.
  /// 
  /// When an item is emitted by one of eight Observables, 
  /// combine the latest item emitted by each Observable 
  /// via a specified function and emit combined item.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static Observable<R> combine8<T1, T2, T3, T4, T5, T6, T7, T8, R>({
    required Observable<T1> source1,
    required Observable<T2> source2,
    required Observable<T3> source3,
    required Observable<T4> source4,
    required Observable<T5> source5,
    required Observable<T6> source6,
    required Observable<T7> source7,
    required Observable<T8> source8,
    required R Function(T1, T2, T3, T4, T5, T6, T7, T8) combiner,
  }) => CombineObservable8(
    source1: source1,
    source2: source2,
    source3: source3,
    source4: source4,
    source5: source5,
    source6: source6,
    source7: source7,
    source8: source8,
    combiner: combiner,
  );

  /// Combine nine `Observable` into one `Observable`.
  /// 
  /// When an item is emitted by one of nine Observables, 
  /// combine the latest item emitted by each Observable 
  /// via a specified function and emit combined item.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static Observable<R> combine9<T1, T2, T3, T4, T5, T6, T7, T8, T9, R>({
    required Observable<T1> source1,
    required Observable<T2> source2,
    required Observable<T3> source3,
    required Observable<T4> source4,
    required Observable<T5> source5,
    required Observable<T6> source6,
    required Observable<T7> source7,
    required Observable<T8> source8,
    required Observable<T9> source9,
    required R Function(T1, T2, T3, T4, T5, T6, T7, T8, T9) combiner,
  }) => CombineObservable9(
    source1: source1,
    source2: source2,
    source3: source3,
    source4: source4,
    source5: source5,
    source6: source6,
    source7: source7,
    source8: source8,
    source9: source9,
    combiner: combiner,
  );
}

/// `ObservableX` is an extension on `Observable` that
/// adds common used operators like `map`, `where`, etc.
extension ObservableX<T> on Observable<T> {
  
  /// Transform the items emitted by an Observable by 
  /// applying a function to each item.
  /// 
  /// The Map operator applies a function of your choosing 
  /// to each item emitted by the source Observable,
  /// and returns an Observable that emits the results of 
  /// these function applications.
  /// 
  /// Copied from: https://reactivex.io/documentation/operators/map.html
  Observable<R> map<R>(R Function(T) convert) {
    return ObservableMap<T, R>(
      convert: convert,
      source: this,
    );
  }


  /// Emit only those items from an Observable that pass a predicate test.
  /// 
  /// The Where operator filters an Observable by only allowing items through 
  /// that pass a test that you specify in the form of a predicate function.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/filter.html
  Observable<T> where(bool Function(T) test) {
    return ObservableWhere<T>(
      test: test,
      source: this,
    );
  }

  /// Mapping source `Observable<T>` to `Observable<R>` 
  /// by casting each item as `R`.
  Observable<R> cast<R>() {
    return ObservableCast<T, R>(
      source: this,
    );
  }

  /// Mirror an Observable and emit only those items that changed
  /// (meaning item is distinct from previous emitted one).
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/distinct.html
  Observable<T> distinct([Equals<T>? equals]) {
    return ObservableDistinct<T>(
      equals: equals,
      source: this,
    );
  }

  /// `DistinctMap` is composition of `Map` and `Distinct`.
  /// 
  /// It first transform the items emitted by applying a function,
  /// then only emit result that is distinct from previous emitted result.
  /// 
  Observable<R> distinctMap<R>(
    R Function(T) convert, {
    Equals<R>? equals,
  }) => map(convert)
    .distinct(equals);

  /// Suppress the first n items emitted by an Observable.
  /// 
  /// You can ignore the first n items emitted by an Observable 
  /// and attend only to those items that come after, 
  /// by modifying the Observable with the Skip operator.
  /// 
  /// Copied from: https://reactivex.io/documentation/operators/skip.html
  Observable<T> skip(int n) {
    return ObservableSkip(
      n: n,
      source: this,
    );
  }

  /// Multicast observable make multiple observers share 
  /// single source subscription. 
  /// 
  /// `Subject` is used to forward source item to downward observers.
  /// 
  /// Shared subscription keep alive using ARC (auto reference count) 
  /// of observers.
  /// 
  Observable<T> multicast({
    Subject<T> Function()? createSubject,
  }) {
    return ObservableMulticast<T>(
      createSubject: createSubject,
      source: this,
    );
  }

  /// Multicast replay observable make multiple observers share 
  /// single source subscription. 
  /// 
  /// `Replayer` is used to forward source item to downward observers. 
  /// 
  /// Shared subscription keep alive using ARC (auto reference count) 
  /// of observers. 
  /// 
  /// Latest n items will be replayed to newly added observer.
  /// 
  Observable<T> multicastReplay(int bufferSize) {
    return multicast(
      createSubject: () => Replayer<T>(
        bufferSize: bufferSize
      ),
    );
  }

}
