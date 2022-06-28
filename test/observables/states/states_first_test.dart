
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

void main() {

  test('`states.first` success', () {

    final states = States<String>((setState) {
      setState('a');
      setState('b');
      setState('c');
      return Disposable.empty;
    });

    final first = states.first;

    expect(first, 'a');

  });

  test('`states.first` failure', () {

    final states = States<String>((setState) {
      return Disposable.empty;
    });

    expect(
      () {
        states.first;
      },
      throwsA(
        isA<LatestStateNotReplayError<String>>()
          .having(
            (error) => error.toString(),
            'description',
            contains("Instance of 'States<String>' should replay latest state synchronously when observed"),
          )
      ),
    );
  });
}
