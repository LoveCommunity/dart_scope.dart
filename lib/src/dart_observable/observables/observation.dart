
import 'package:disposal/disposal.dart';
import 'package:meta/meta.dart';

import '../observers/observer.dart';

@internal
abstract class Observation<T> implements Disposable {

  Observation({
    required this.onData,
  }) {
    init();
  }

  @internal
  final OnData<T> onData;

  @internal
  @mustCallSuper
  void init();
}