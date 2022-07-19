
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../shared/observable_tester.dart';

void main() {

  test('`states.skip`', () {

    final states = States<String>((setState) {
      setState('a');
      setState('b');
      setState('c');
      setState('d');
      setState('e');
      setState('f');
      return Disposable.empty;
    });

    final skip = states.skip(3);

    final tester = ObservableTester(
      skip
    );

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, [
      'd',
      'e',
      'f',
    ]);

    tester.stopObserve();
  });

  test('`states.skipFirst`', () {

    final states = States<String>((setState) {
      setState('a');
      setState('b');
      setState('c');
      return Disposable.empty;
    });

    final skip = states.skipFirst();

    final tester = ObservableTester(
      skip
    );

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, [
      'b',
      'c',
    ]);

    tester.stopObserve();

  });
}
