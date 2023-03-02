
import 'package:disposal/disposal.dart';
import 'package:meta/meta.dart';

import 'observable.dart';
import '../observers/observer.dart';

@internal
abstract class Observation<O extends Observable<T>, T> implements Disposable {

  Observation({
    required this.configuration,
    required this.emit,
  }) {
    init();
  }

  @internal
  final O configuration;

  @internal
  final OnData<T> emit;

  @internal
  @mustCallSuper
  void init();
}