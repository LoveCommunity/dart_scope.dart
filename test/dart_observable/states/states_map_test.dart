
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../shared/states_tester.dart';

void main() {

  test('`states.map`', () {

    final states = States<String>((setState) {
      setState('a');
      setState('ab');
      setState('abc');
      return Disposable.empty;
    });

    final map = states
      .map<int>((state) => state.length);

    final tester = StatesTester(
      map,
    );

    expect(tester.recorded, <int>[]);
    tester.startObserve();
    expect(tester.recorded, [
      1,
      2,
      3,
    ]);

    tester.stopObserve();

  });
}
