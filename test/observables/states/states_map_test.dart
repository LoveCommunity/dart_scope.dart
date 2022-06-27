
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../toolbox/states_tester.dart';

void main() {

  test('`states.map`', () {

    final states = States<String>((onData) {
      onData('a');
      onData('ab');
      onData('abc');
      return Disposable.empty;
    });

    final map = states
      .map<int>((data) => data.length);

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
