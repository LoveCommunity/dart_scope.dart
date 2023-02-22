
import 'package:disposal/disposal.dart';
import 'package:meta/meta.dart';

import '../observers/observer.dart';

abstract class Observation<T> implements Disposable {

  Observation({
    required this.emit,
  }) {
    init();
  }

  @protected
  final OnData<T> emit;

  @protected
  @mustCallSuper
  void init();
}