
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'observable.dart';

@internal
class CombineObservable<T, R> implements Observable<R> {

  const CombineObservable({
    required List<Observable<T>> children,
    required R Function(List<T> items) combiner,
  }): _children = children,
    _combiner = combiner;

  final List<Observable<T>> _children;
  final R Function(List<T> items) _combiner;

  @override
  Disposable observe(OnData<R> onData) {
    if (_children.isEmpty) {
      return Disposable.empty;
    }

    final length = _children.length;
    final emitted = <int>{};
    final latests = List<Object?>.filled(length, null);

    Disposable _observe(int index) {
      return _children[index].observe((data) {
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
      children: observations,
    );
  }
}

@internal
class CombineObservable2<T1, T2, R> extends CombineObservable<Object?, R> {

  CombineObservable2({
    required Observable<T1> child1,
    required Observable<T2> child2,
    required R Function(T1, T2) combiner,
  }): super(
    children: [
      child1.cast<Object?>(),
      child2.cast<Object?>(),
    ],
    combiner: (items) => combiner(
      items[0] as T1,
      items[1] as T2,
    ),
  );
}

@internal
class CombineObservable3<T1, T2, T3, R> extends CombineObservable<Object?, R> {

  CombineObservable3({
    required Observable<T1> child1,
    required Observable<T2> child2,
    required Observable<T3> child3,
    required R Function(T1, T2, T3) combiner,
  }): super(
    children: [
      child1.cast<Object?>(),
      child2.cast<Object?>(),
      child3.cast<Object?>(),
    ],
    combiner: (items) => combiner(
      items[0] as T1,
      items[1] as T2,
      items[2] as T3,
    ),
  );
}
