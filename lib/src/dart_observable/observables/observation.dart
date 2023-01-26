
import 'package:dart_scope/dart_scope.dart';
import 'package:meta/meta.dart';

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