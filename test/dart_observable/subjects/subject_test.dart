
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

void main() {

  test('`Subject` is `Observable`, `Observer` and `Disposable`', () {
    final subject = _MockSubject<String>();
    expect(subject, isA<Observable<String>>());
    expect(subject, isA<Observer<String>>());
    expect(subject, isA<Disposable>());
  });

}

class _MockSubject<T> implements Subject<T> {
  
  @override
  Disposable observe(OnData<T> onData) {
    throw UnimplementedError();
  }

  @override
  void onData(T data) {
    throw UnimplementedError();
  }
  
  @override
  void dispose() {
    throw UnimplementedError();
  }
}
