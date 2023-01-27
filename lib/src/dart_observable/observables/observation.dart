
import 'package:disposal/disposal.dart';
import 'package:meta/meta.dart';

import '../observers/observer.dart';

@internal
abstract class Observation<T> implements Disposable {

  Observation({
    required this.emit,
  }) {
    init();
  }

  @internal
  final OnData<T> emit;

  @internal
  @mustCallSuper
  void init();
}