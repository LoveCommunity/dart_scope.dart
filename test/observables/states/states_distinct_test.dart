

import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../shared/states_tester.dart';

void main() {

  test('`states.distinct` default equals', () {

    final states = States<String>((setState) {
      setState('a');
      setState('a');
      setState('b');
      setState('b');
      return Disposable.empty;
    });

    final distinct = states.distinct();

    final tester = StatesTester(
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

  test('`states.distinct` custom equals', () {

    final states = States<String>((setState) {
      setState('a');
      setState('b');
      setState('aa');
      setState('bb');
      return Disposable.empty;
    });

    final distinct = states
      .distinct((it1, it2) => it1.length == it2.length);

    final tester = StatesTester(
      distinct,
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
