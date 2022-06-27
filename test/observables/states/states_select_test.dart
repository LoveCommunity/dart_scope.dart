
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../toolbox/states_tester.dart';

void main() {
  
  test('`states.select` default equals', () {

    final states = States<String>((onData) {
      onData('a');
      onData('a');
      onData('b');
      onData('b');
      return Disposable.empty;
    });

    final select = states
      .select((it) => '1$it');

    final tester = StatesTester(
      select,
    );

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      '1a',
      '1b',
    ]);

    tester.stopObserve();

  });

  test('`states.select` custom equals', () {

    final states = States<String>((onData) {
      onData('a');
      onData('b');
      onData('aa');
      onData('bb');
      return Disposable.empty;
    });

    final select = states
      .select<String>(
        (it) => '1$it',
        equals: (it1, it2) => it1.length == it2.length,
      );

    final tester = StatesTester(
      select,
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
