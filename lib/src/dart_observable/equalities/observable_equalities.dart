
import 'package:collection/collection.dart';
import 'package:typedef_foundation/typedef_foundation.dart';

import '../observables/base_observable.dart';
import '../observables/instance_as_observable.dart';
import '../observables/observable.dart';

class FallbackObservableEquality<T> implements Equality<Observable<T>> {
  const FallbackObservableEquality();

  @override
  bool equals(Observable<T> e1, Observable<T> e2) {
    return identical(e1, e2)
      || e1.runtimeType == e2.runtimeType;
  }

  @override
  int hash(Observable<T> e) {
    return e.runtimeType.hashCode;
  }

  @override
  bool isValidKey(Object? o) {
    return o is Observable<T>;
  }
}

class PipeObservableEquality<T, R> implements Equality<PipeObservable<T, R>> {
  const PipeObservableEquality(this.getObservableEquality);

  final Getter<Equality<Observable<T>>> getObservableEquality;

  @override
  bool equals(PipeObservable<T, R> e1, PipeObservable<T, R> e2) {
    return identical(e1, e2)
      || e1.runtimeType == e2.runtimeType
        && getObservableEquality().equals(e1.observable, e2.observable);
  }

  @override
  int hash(PipeObservable<T, R> e) {
    return Object.hash(
      e.runtimeType,
      getObservableEquality().hash(e.observable)
    );
  }

  @override
  bool isValidKey(Object? o) {
    return o is PipeObservable<T, R>;
  }
}

class MultiSourcePipeObservableEquality<T, R> implements Equality<MultiSourcePipeObservable<T, R>> {
  MultiSourcePipeObservableEquality(this.getObservableEquality);

  final Getter<Equality<Observable<T>>> getObservableEquality;
  late final listEquality = ListEquality<Observable<T>>(
    getObservableEquality()
  );

  @override
  bool equals(MultiSourcePipeObservable<T, R> e1, MultiSourcePipeObservable<T, R> e2) {
    return identical(e1, e2)
      || e1.runtimeType == e2.runtimeType
        && listEquality.equals(e1.observables, e2.observables);
  }

  @override
  int hash(MultiSourcePipeObservable<T, R> e) {
    return Object.hash(
      e.runtimeType,
      listEquality.hash(e.observables),
    );
  }

  @override
  bool isValidKey(Object? o) {
    return o is MultiSourcePipeObservable<T, R>;
  }
}

class InstanceAsObservableEquality<T, R> implements Equality<InstanceAsObservable<T, R>> {
  const InstanceAsObservableEquality();

  @override
  bool equals(InstanceAsObservable<T, R> e1, InstanceAsObservable<T, R> e2) {
    return identical(e1, e2)
      || e1.runtimeType == e2.runtimeType
        && identical(e1.instance, e2.instance);
  }

  @override
  int hash(InstanceAsObservable<T, R> e) {
    return Object.hash(
      e.runtimeType,
      e.instance,
    );
  }

  @override
  bool isValidKey(Object? o) {
    return o is InstanceAsObservable<T, R>;
  }
}

typedef ObservableEqualityFactory = Equality<Observable<Object?>> Function(Getter<Equality<Observable<Object?>>> getDeepEquality);

Equality<Observable<Object?>> createDeepObservableEquality(List<ObservableEqualityFactory> equalityFactories) {
  late final Equality<Observable<Object?>> deepEquality;
  Equality<Observable<Object?>> getDeepEquality() => deepEquality;
  final equalities = equalityFactories
    .map((factory) => factory(getDeepEquality));
  deepEquality = MultiEquality(equalities);
  return deepEquality;
}

final List<ObservableEqualityFactory> observableEqualityFactories = [
  (getDeepEquality) => PipeObservableEquality<Object?, Object?>(getDeepEquality),
  (getDeepEquality) => MultiSourcePipeObservableEquality<Object?, Object?>(getDeepEquality),
  (_) => const InstanceAsObservableEquality<Object?, Object?>(),
  (_) => const FallbackObservableEquality<Object?>(),
];

final deepObservableEquality = createDeepObservableEquality(observableEqualityFactories);