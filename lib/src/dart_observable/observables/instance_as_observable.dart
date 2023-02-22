import 'package:meta/meta.dart';

import '../observers/observer.dart';
import 'observable.dart';
import 'observation.dart';

abstract class InstanceAsObservable<T, R> implements Observable<R> {
  const InstanceAsObservable({
    required this.instance,
  });
  @internal
  final T instance;  
}

abstract class InstanceObservation<T, R> extends Observation<R> {
  InstanceObservation({
    required this.instance,
    required OnData<R> emit,
  }): super(emit: emit);
  @internal
  final T instance;  
}