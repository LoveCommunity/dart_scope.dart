
import '../observers/observer.dart';
import 'observable.dart';
import 'observation.dart';

abstract class InstanceAsObservable<T, R> implements Observable<R> {
  const InstanceAsObservable({
    required this.instance,
  });
  final T instance;  
}

abstract class InstanceObservation<T, R> extends Observation<R> {
  InstanceObservation({
    required this.instance,
    required OnData<R> emit,
  }): super(emit: emit);
  final T instance;  
}