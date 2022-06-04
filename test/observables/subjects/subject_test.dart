
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

void main() {

  test('subject is observable, observer and disposable', () {
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
