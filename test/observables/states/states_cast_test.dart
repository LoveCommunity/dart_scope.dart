
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../toolbox/states_tester.dart';

void main() {

  test('`states.cast` success', () {

    final states = States<String>((setState) {
      setState('a');
      return Disposable.empty;
    });

    final cast = states.cast<Object>();

    final tester = StatesTester(
      cast,
    );

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      'a',
    ]);

    tester.stopObserve();

  });


  test('`states.cast` failure', () {

    final states = States<String>((setState) {
      setState('a');
      return Disposable.empty;
    });

    final cast = states.cast<int>();

    expect(
      () {
        cast.observe((_) {});
      },
      throwsA(
        isA<TypeError>()
      ),
    );

  });
}
