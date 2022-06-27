
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../toolbox/observable_tester.dart';

void main() {

  test('`states.skip`', () {

    final states = States<String>((onData) {
      onData('a');
      onData('b');
      onData('c');
      onData('d');
      onData('e');
      onData('f');
      return Disposable.empty;
    });

    final skip = states.skip(3);

    final tester = ObservableTester(
      skip
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

  test('`states.skipFirst`', () {

    final states = States<String>((onData) {
      onData('a');
      onData('b');
      onData('c');
      return Disposable.empty;
    });

    final skip = states.skipFirst();

    final tester = ObservableTester(
      skip
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
