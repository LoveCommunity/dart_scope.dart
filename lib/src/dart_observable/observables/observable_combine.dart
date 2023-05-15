
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'base_observable.dart';
import 'observable.dart';
import 'observation.dart';

@internal
class ObservableCombine<T, R> extends MultiSourcePipeObservable<T, R> {

  const ObservableCombine({
    required super.sources,
    required this.combiner,
  });

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


@internal
class CombineObservable4<T1, T2, T3, T4, R> extends ObservableCombine<Object?, R> {

  CombineObservable4({
    required Observable<T1> source1,
    required Observable<T2> source2,
    required Observable<T3> source3,
    required Observable<T4> source4,
    required R Function(T1, T2, T3, T4) combiner,
  }): super(
    sources: [
      source1.cast<Object?>(),
      source2.cast<Object?>(),
      source3.cast<Object?>(),
      source4.cast<Object?>(),
    ],
    combiner: (items) => combiner(
      items[0] as T1,
      items[1] as T2,
      items[2] as T3,
      items[3] as T4,
    ),
  );
}

@internal
class CombineObservable5<T1, T2, T3, T4, T5, R> extends ObservableCombine<Object?, R> {

  CombineObservable5({
    required Observable<T1> source1,
    required Observable<T2> source2,
    required Observable<T3> source3,
    required Observable<T4> source4,
    required Observable<T5> source5,
    required R Function(T1, T2, T3, T4, T5) combiner,
  }): super(
    sources: [
      source1.cast<Object?>(),
      source2.cast<Object?>(),
      source3.cast<Object?>(),
      source4.cast<Object?>(),
      source5.cast<Object?>(),
    ],
    combiner: (items) => combiner(
      items[0] as T1,
      items[1] as T2,
      items[2] as T3,
      items[3] as T4,
      items[4] as T5,
    ),
  );
}

@internal
class CombineObservable6<T1, T2, T3, T4, T5, T6, R> extends ObservableCombine<Object?, R> {

  CombineObservable6({
    required Observable<T1> source1,
    required Observable<T2> source2,
    required Observable<T3> source3,
    required Observable<T4> source4,
    required Observable<T5> source5,
    required Observable<T6> source6,
    required R Function(T1, T2, T3, T4, T5, T6) combiner,
  }): super(
    sources: [
      source1.cast<Object?>(),
      source2.cast<Object?>(),
      source3.cast<Object?>(),
      source4.cast<Object?>(),
      source5.cast<Object?>(),
      source6.cast<Object?>(),
    ],
    combiner: (items) => combiner(
      items[0] as T1,
      items[1] as T2,
      items[2] as T3,
      items[3] as T4,
      items[4] as T5,
      items[5] as T6,
    ),
  );
}

@internal
class CombineObservable7<T1, T2, T3, T4, T5, T6, T7, R> extends ObservableCombine<Object?, R> {

  CombineObservable7({
    required Observable<T1> source1,
    required Observable<T2> source2,
    required Observable<T3> source3,
    required Observable<T4> source4,
    required Observable<T5> source5,
    required Observable<T6> source6,
    required Observable<T7> source7,
    required R Function(T1, T2, T3, T4, T5, T6, T7) combiner,
  }): super(
    sources: [
      source1.cast<Object?>(),
      source2.cast<Object?>(),
      source3.cast<Object?>(),
      source4.cast<Object?>(),
      source5.cast<Object?>(),
      source6.cast<Object?>(),
      source7.cast<Object?>(),
    ],
    combiner: (items) => combiner(
      items[0] as T1,
      items[1] as T2,
      items[2] as T3,
      items[3] as T4,
      items[4] as T5,
      items[5] as T6,
      items[6] as T7,
    ),
  );
}

@internal
class CombineObservable8<T1, T2, T3, T4, T5, T6, T7, T8, R> extends ObservableCombine<Object?, R> {

  CombineObservable8({
    required Observable<T1> source1,
    required Observable<T2> source2,
    required Observable<T3> source3,
    required Observable<T4> source4,
    required Observable<T5> source5,
    required Observable<T6> source6,
    required Observable<T7> source7,
    required Observable<T8> source8,
    required R Function(T1, T2, T3, T4, T5, T6, T7, T8) combiner,
  }): super(
    sources: [
      source1.cast<Object?>(),
      source2.cast<Object?>(),
      source3.cast<Object?>(),
      source4.cast<Object?>(),
      source5.cast<Object?>(),
      source6.cast<Object?>(),
      source7.cast<Object?>(),
      source8.cast<Object?>(),
    ],
    combiner: (items) => combiner(
      items[0] as T1,
      items[1] as T2,
      items[2] as T3,
      items[3] as T4,
      items[4] as T5,
      items[5] as T6,
      items[6] as T7,
      items[7] as T8,
    ),
  );
}

@internal
class CombineObservable9<T1, T2, T3, T4, T5, T6, T7, T8, T9, R> extends ObservableCombine<Object?, R> {

  CombineObservable9({
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
  }): super(
    sources: [
      source1.cast<Object?>(),
      source2.cast<Object?>(),
      source3.cast<Object?>(),
      source4.cast<Object?>(),
      source5.cast<Object?>(),
      source6.cast<Object?>(),
      source7.cast<Object?>(),
      source8.cast<Object?>(),
      source9.cast<Object?>(),
    ],
    combiner: (items) => combiner(
      items[0] as T1,
      items[1] as T2,
      items[2] as T3,
      items[3] as T4,
      items[4] as T5,
      items[5] as T6,
      items[6] as T7,
      items[7] as T8,
      items[8] as T9,
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
