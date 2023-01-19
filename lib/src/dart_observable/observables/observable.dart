
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
    Observe<T> observe
  ) = ObservableCreate;
  
  /// Combine multiple `Observable` into one `Observable`.
  /// 
  /// When an item is emitted by one of multiple Observables, 
  /// combine the latest item emitted by each Observable 
  /// via a specified function and emit combined item.
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/combinelatest.html
  static Observable<R> combine<T, R>({
    required List<Observable<T>> observables,
    required R Function(List<T> items) combiner,
  }) => ObservableCombine(
    observables: observables,
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
    required Observable<T1> observable1,
    required Observable<T2> observable2,
    required R Function(T1, T2) combiner,
  }) => CombineObservable2(
    observable1: observable1,
    observable2: observable2,
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
      observable: this,
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
      observable: this,
    );
  }

  /// Mapping source `Observable<T>` to `Observable<R>` 
  /// by casting each item as `R`.
  Observable<R> cast<R>() {
    return ObservableCast<T, R>(
      observable: this,
    );
  }

  /// Mirror an Observable and emit only those items that changed
  /// (meaning item is distinct from previous emitted one).
  /// 
  /// Modified from: https://reactivex.io/documentation/operators/distinct.html
  Observable<T> distinct([Equals<T>? equals]) {
    return ObservableDistinct<T>(
      equals: equals,
      observable: this,
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
      observable: this,
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
      observable: this,
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
