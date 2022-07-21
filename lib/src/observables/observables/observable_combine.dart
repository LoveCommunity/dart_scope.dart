
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'observable.dart';

@internal
class ObservableCombine<T, R> implements Observable<R> {

  const ObservableCombine({
    required List<Observable<T>> observables,
    required R Function(List<T> items) combiner,
  }): _observables = observables,
    _combiner = combiner;

  final List<Observable<T>> _observables;
  final R Function(List<T> items) _combiner;

  @override
  Disposable observe(OnData<R> onData) {
    if (_observables.isEmpty) {
      return Disposable.empty;
    }

    final length = _observables.length;
    final emitted = <int>{};
    final latests = List<Object?>.filled(length, null);

    Disposable _observe(int index) {
      return _observables[index].observe((data) {
        if (!emitted.contains(index)) {
          emitted.add(index);
        }
        latests[index] = data;
        if (emitted.length == length) {
          final list = List<T>.from(latests, growable: false);
          final result = _combiner(list);
          onData(result);
        }
      });
    }

    final observations = Iterable<Disposable>
      .generate(length, _observe)
      .toList();

    return Disposable.combine(
      disposables: observations,
    );
  }
}

@internal
class CombineObservable2<T1, T2, R> extends ObservableCombine<Object?, R> {

  CombineObservable2({
    required Observable<T1> observable1,
    required Observable<T2> observable2,
    required R Function(T1, T2) combiner,
  }): super(
    observables: [
      observable1.cast<Object?>(),
      observable2.cast<Object?>(),
    ],
    combiner: (items) => combiner(
      items[0] as T1,
      items[1] as T2,
    ),
  );
}

@internal
class CombineObservable3<T1, T2, T3, R> extends ObservableCombine<Object?, R> {

  CombineObservable3({
    required Observable<T1> observable1,
    required Observable<T2> observable2,
    required Observable<T3> observable3,
    required R Function(T1, T2, T3) combiner,
  }): super(
    observables: [
      observable1.cast<Object?>(),
      observable2.cast<Object?>(),
      observable3.cast<Object?>(),
    ],
    combiner: (items) => combiner(
      items[0] as T1,
      items[1] as T2,
      items[2] as T3,
    ),
  );
}
