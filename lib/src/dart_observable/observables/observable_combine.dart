
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'observable.dart';
import 'observation.dart';

@internal
class ObservableCombine<T, R> implements Observable<R> {

  const ObservableCombine({
    required this.sources,
    required this.combiner,
  });

  final List<Observable<T>> sources;
  final R Function(List<T> items) combiner;

  @override
  Disposable observe(OnData<R> onData) {
    if (sources.isEmpty) {
      return Disposable.empty;
    }
    return _Observation<T, R>(
      configuration: this,
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

class _Observation<T, R> extends Observation<ObservableCombine<T, R>, R> {

  _Observation({
    required super.configuration, 
    required super.emit,
  });

  late final int _sourcesLength;
  late final Set<int> _emitted;
  late final List<T?> _latestItems;
  late final List<Disposable> _sourceObservations;

  @override
  void init() {
    _sourcesLength = configuration.sources.length;
    _emitted = <int>{};
    _latestItems = List<T?>.filled(_sourcesLength, null);
    _sourceObservations = Iterable<Disposable>
      .generate(_sourcesLength, _observeIndexed)
      .toList();
  }

  Disposable _observeIndexed(int index) {
    return configuration.sources[index]
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
        final combinedItem = configuration.combiner(items);
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
