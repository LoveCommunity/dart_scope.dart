
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'observable.dart';
import 'observation.dart';

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
    return _Observation<T, R>(
      observables: _observables,
      combiner: _combiner,
      emit: onData,
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

class _Observation<T, R> extends Observation<R> {

  _Observation({
    required List<Observable<T>> observables,
    required R Function(List<T> items) combiner,
    required OnData<R> emit,
  }): _observables = observables,
    _combiner = combiner, 
    super(emit: emit);

  final List<Observable<T>> _observables;
  final R Function(List<T> items) _combiner;

  late final int _observablesLength;
  late final Set<int> _emitted;
  late final List<T?> _latests;
  late final Disposable _disposable;

  @override
  void init() {
    _observablesLength = _observables.length;
    _emitted = <int>{};
    _latests = List<T?>.filled(_observablesLength, null);
    final sourceObservations = Iterable<Disposable>
      .generate(_observablesLength, _observeIndexed)
      .toList();
    _disposable = Disposable.combine(
      disposables: sourceObservations
    );
  }

  Disposable _observeIndexed(int index) {
    return _observables[index]
      .observe(_onDataIndexed(index));
  }

  OnData<T> _onDataIndexed(int index) {
    return (data) {
      if (!_emitted.contains(index)) {
        _emitted.add(index);
      }
      _latests[index] = data;
      if (_emitted.length == _observablesLength) {
        final items = List<T>.from(_latests, growable: false);
        final combinedItem = _combiner(items);
        emit(combinedItem);
      }
    };
  }

  @override
  void dispose() {
    _disposable.dispose(); 
  }
}
