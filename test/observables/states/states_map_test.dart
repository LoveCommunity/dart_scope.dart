
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../toolbox/states_tester.dart';

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

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      1,
      2,
      3,
    ]);

    tester.stopObserve();

  });
}
