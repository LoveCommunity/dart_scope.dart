
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';
import '../../toolbox/observable_tester.dart';

void main() {
  
  test('distinct observable default equals', () {
    
    final observable = Observable<String>((onData) {
      onData('a');
      onData('a');
      onData('b');
      onData('b');
      return Disposable.empty;
    });

    final distinctObservable = observable.distinct();

    final tester = ObservableTester(
      distinctObservable,
    );

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      'a',
      'b',
    ]);

    tester.stopObserve();
  });

  test('distinct observable custom equals', () {

    final observable = Observable<String>((onData) {
      onData('a');
      onData('b');
      onData('aa');
      onData('bb');
      return Disposable.empty;
    });

    final distinctObservable = observable
      .distinct((it1, it2) => it1.length == it2.length);

    final tester = ObservableTester(
      distinctObservable
    );

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      'a',
      'aa',
    ]);
  
    tester.stopObserve();
  });
}
