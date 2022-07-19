
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';
import '../shared/observable_tester.dart';

void main() {
  
  test('`observable.distinct` default equals', () {
    
    final observable = Observable<String>((onData) {
      onData('a');
      onData('a');
      onData('b');
      onData('b');
      return Disposable.empty;
    });

    final distinct = observable.distinct();

    final tester = ObservableTester(
      distinct,
    );

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, [
      'a',
      'b',
    ]);

    tester.stopObserve();
  });

  test('`observable.distinct` custom equals', () {

    final observable = Observable<String>((onData) {
      onData('a');
      onData('b');
      onData('aa');
      onData('bb');
      return Disposable.empty;
    });

    final distinct = observable
      .distinct((it1, it2) => it1.length == it2.length);

    final tester = ObservableTester(
      distinct
    );

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, [
      'a',
      'aa',
    ]);
  
    tester.stopObserve();
  });
}
