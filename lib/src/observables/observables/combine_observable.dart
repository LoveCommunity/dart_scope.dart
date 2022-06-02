
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'observable.dart';


@internal
class CombineObservable<R> implements Observable<R> {

  const CombineObservable({
    required List<Observable<Object?>> children,
    required R Function(List<Object?> items) combiner,
  }): _children = children,
    _combiner = combiner;

  final List<Observable<Object?>> _children;
  final R Function(List<Object?> items) _combiner;

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
          final result = _combiner(List.from(latests)); 
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
class CombineObservable2<T1, T2, R> implements Observable<R> {

  CombineObservable2({
    required Observable<T1> child1,
    required Observable<T2> child2,
    required R Function(T1, T2) combiner,
  }): _proxy = Observable<R>.combine(
        children: [
          child1.cast<Object?>(),
          child2.cast<Object?>(),
        ],
        combiner: (items) => combiner(
          items[0] as T1,
          items[1] as T2,
        ),
      );

  final Observable<R> _proxy;

  @override
  Disposable observe(OnData<R> onData) {
    return _proxy.observe(onData);
  }
}

@internal
class CombineObservable3<T1, T2, T3, R> implements Observable<R> {

  CombineObservable3({
    required Observable<T1> child1,
    required Observable<T2> child2,
    required Observable<T3> child3,
    required R Function(T1, T2, T3) combiner,
  }): _proxy = Observable<R>.combine(
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

  final Observable<R> _proxy;

  @override
  Disposable observe(OnData<R> onData) {
    return _proxy.observe(onData);
  }
}
