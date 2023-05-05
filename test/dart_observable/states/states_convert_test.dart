
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../shared/states_tester.dart';

void main() {
  
  test('states.convert default equals', () {

    final states = States<String>((setState) {
      setState('a');
      setState('a');
      setState('b');
      setState('b');
      return Disposable.empty;
    });

    final convert = states
      .convert((it) => '1$it');

    final tester = StatesTester(
      convert,
    );

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, [
      '1a',
      '1b',
    ]);

    tester.stopObserve();

  });

  test('states.convert custom equals', () {

    final states = States<String>((setState) {
      setState('a');
      setState('b');
      setState('aa');
      setState('bb');
      return Disposable.empty;
    });

    final convert = states
      .convert<String>(
        (it) => '1$it',
        equals: (it1, it2) => it1.length == it2.length,
      );

    final tester = StatesTester(
      convert,
    );

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, [
      '1a',
      '1aa',
    ]);

    tester.stopObserve();

  });
}
