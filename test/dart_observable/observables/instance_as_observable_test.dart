
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

void main() {

  test('InstanceAsObservable common', () {

    final stream = Stream.fromIterable([0, 1, 2]);
    final observable = _StreamAsObservable(stream);

    final isIdentical = identical(stream, observable.instance);

    expect(isIdentical, true);
  });
}

class _StreamAsObservable<T> extends InstanceAsObservable<Stream<T>, T> {

  _StreamAsObservable(super.instance);

  @override
  Disposable observe(OnData<T> onData) {
    throw UnimplementedError();
  }
}