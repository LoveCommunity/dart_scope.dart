
import 'observable.dart';

abstract class PipeObservable<T, R> implements Observable<R> {
  const PipeObservable({
    required this.observable,
  });
  final Observable<T> observable; 
}

abstract class MultiSourcePipeObservable<T, R> implements Observable<R> {
  const MultiSourcePipeObservable({
    required this.observables,
  });
  final List<Observable<T>> observables;
}