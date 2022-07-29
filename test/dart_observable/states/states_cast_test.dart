
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../shared/states_tester.dart';

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

    expect(tester.recorded, <String>[]);
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
