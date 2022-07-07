
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';
import '../shared/observable_tester.dart';

void main() {

  test('`observable.distinctMap` default equals', () {

    final observable = Observable<String>((onData) {
      onData('a');
      onData('a');
      onData('b');
      onData('b');
      return Disposable.empty;
    });

    final distinctMap = observable
      .distinctMap((it) => '1$it');

    final tester = ObservableTester(
      distinctMap,
    );

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      '1a',
      '1b',
    ]);

    tester.stopObserve();

  });

  test('`observable.distinctMap` custom equals', () {

    final observable = Observable<String>((onData) {
      onData('a');
      onData('b');
      onData('aa');
      onData('bb');
      return Disposable.empty;
    });

    final distinctMap = observable
      .distinctMap<String>(
        (it) => '1$it',
        equals: (it1, it2) => it1.length == it2.length,
      );

    final tester = ObservableTester(
      distinctMap,
    );

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      '1a',
      '1aa',
    ]);

    tester.stopObserve();

  });
}
