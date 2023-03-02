
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'observable.dart';
import 'observation.dart';

@internal
class ObservableCombine<T, R> implements Observable<R> {

  const ObservableCombine({
    required List<Observable<T>> sources,
    required R Function(List<T> items) combiner,
  }): _sources = sources,
    _combiner = combiner;

  final List<Observable<T>> _sources;
  final R Function(List<T> items) _combiner;

  @override
  Disposable observe(OnData<R> onData) {
    if (_sources.isEmpty) {
      return Disposable.empty;
    }
    return _Observation<T, R>(
      sources: _sources,
      combiner: _combiner,
      emit: onData,
    );
  }
}

@internal
class CombineObservable2<T1, T2, R> extends ObservableCombine<Object?, R> {

  CombineObservable2({
    required Observable<T1> source1,
    required Observable<T2> source2,
    required R Function(T1, T2) combiner,
  }): super(
    sources: [
      source1.cast<Object?>(),
      source2.cast<Object?>(),
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
    required Observable<T1> source1,
    required Observable<T2> source2,
    required Observable<T3> source3,
    required R Function(T1, T2, T3) combiner,
  }): super(
    sources: [
      source1.cast<Object?>(),
      source2.cast<Object?>(),
      source3.cast<Object?>(),
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
    required List<Observable<T>> sources,
    required R Function(List<T> items) combiner,
    required super.emit,
  }): _sources = sources,
    _combiner = combiner;

  final List<Observable<T>> _sources;
  final R Function(List<T> items) _combiner;

  late final int _sourcesLength;
  late final Set<int> _emitted;
  late final List<T?> _latestItems;
  late final List<Disposable> _sourceObservations;

  @override
  void init() {
    _sourcesLength = _sources.length;
    _emitted = <int>{};
    _latestItems = List<T?>.filled(_sourcesLength, null);
    _sourceObservations = Iterable<Disposable>
      .generate(_sourcesLength, _observeIndexed)
      .toList();
  }

  Disposable _observeIndexed(int index) {
    return _sources[index]
      .observe(_onDataIndexed(index));
  }

  OnData<T> _onDataIndexed(int index) {
    return (data) {
      if (!_emitted.contains(index)) {
        _emitted.add(index);
      }
      _latestItems[index] = data;
      if (_emitted.length == _sourcesLength) {
        final items = List<T>.from(_latestItems, growable: false);
        final combinedItem = _combiner(items);
        emit(combinedItem);
      }
    };
  }

  @override
  void dispose() {
    for (final observation in _sourceObservations.reversed) {
      observation.dispose();
    }
  }
}
