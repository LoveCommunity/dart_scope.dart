
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../shared/states_tester.dart';

void main() {

  test('States.defaultConstructor common', () {

    final states = States<String>((setState) {
      setState('a');
      return Disposable.empty;
    });

    final tester = StatesTester(
      states,
    );

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, [
      'a',
    ]);

    tester.stopObserve();

  });

  test('States.defaultConstructor observation dispose', () {

    int invokes = 0;

    final states = States<String>((setState) {
      setState('a');
      return Disposable(() {
        invokes += 1;
      });
    });

    final observation = states.observe((_) {});

    expect(invokes, 0);
    observation.dispose();
    expect(invokes, 1);
  });

  test('States.defaultConstructor not receive data after disposed', () async {

    final states = States<String>((setState) {
      setState('a');
      Future(() => setState('b'));
      return Disposable.empty;
    });

    final tester = StatesTester(
      states,
    );

    tester.startObserve();

    expect(tester.recorded, [
      'a',
    ]);

    tester.stopObserve();

    await Future(() {});
    expect(tester.recorded, [
      'a',
    ]);

  });

}
