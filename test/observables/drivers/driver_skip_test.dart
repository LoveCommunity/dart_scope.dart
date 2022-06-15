
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../toolbox/observable_tester.dart';

void main() {

  test('`driver.skip`', () {

    final driver = Driver<String>((onData) {
      onData('a');
      onData('b');
      onData('c');
      onData('d');
      onData('e');
      onData('f');
      return Disposable.empty;
    });

    final skipObservable = driver.skip(3);

    final tester = ObservableTester(
      skipObservable
    );

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      'd',
      'e',
      'f',
    ]);

    tester.stopObserve();
  });

  test('`driver.skipFirst`', () {

    final driver = Driver<String>((onData) {
      onData('a');
      onData('b');
      onData('c');
      return Disposable.empty;
    });

    final skipObservable = driver.skipFirst();

    final tester = ObservableTester(
      skipObservable
    );

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      'b',
      'c',
    ]);

    tester.stopObserve();

  });
}
