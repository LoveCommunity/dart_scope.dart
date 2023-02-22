import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

final observable1 = Observable<int>((_) {
  return Disposable.empty;
});

final observable2 = Observable<int>((_) {
  return Disposable.empty;
});

bool _deepEquals(Observable<Object?> e1, Observable<Object?> e2) {
  return deepObservableEquality.equals(e1, e2);
} 

void main() {

  test('`deepObservableEquality` quick test', () {

    expect(
      _deepEquals(observable1, observable2), 
      true
    );

    expect(
      _deepEquals(
        observable1
          .map((it) => '$it'), 
        observable2
          .map((it) => '$it')
      ),
      true,
    );

    expect(
      _deepEquals(
        observable1
          .map((it) => '$it')
          .distinct(),
        observable2
          .map((it) => '$it')
          .distinct()
      ),
      true
    );

    expect(
      _deepEquals(
        observable1
          .map((it) => '$it')
          .distinct(),
        observable2
          .distinct()
          .map((it) => '$it')
      ),
      false
    );

  });
}