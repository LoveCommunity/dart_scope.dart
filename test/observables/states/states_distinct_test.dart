

import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../toolbox/states_tester.dart';

void main() {

  test('`states.distinct` default equals', () {

    final states = States<String>((onData) {
      onData('a');
      onData('a');
      onData('b');
      onData('b');
      return Disposable.empty;
    });

    final distinct = states.distinct();

    final tester = StatesTester(
      distinct,
    );

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      'a',
      'b',
    ]);

    tester.stopObserve();

  });

  test('`states.distinct` custom equals', () {

    final states = States<String>((onData) {
      onData('a');
      onData('b');
      onData('aa');
      onData('bb');
      return Disposable.empty;
    });

    final distinct = states
      .distinct((it1, it2) => it1.length == it2.length);

    final tester = StatesTester(
      distinct,
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
