
import 'package:disposal/disposal.dart';
import 'package:meta/meta.dart';

import 'observable.dart';
import '../observers/observer.dart';

abstract class Observation<O extends Observable<T>, T> implements Disposable {

  Observation({
    required this.configuration,
    required this.emit,
  }) {
    init();
  }
  
  final O configuration;
  final OnData<T> emit;

  @mustCallSuper
  void init();
}