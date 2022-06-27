
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

void main() {

  test('`states.first` success', () {

    final states = States<String>((onData) {
      onData('a');
      onData('b');
      onData('c');
      return Disposable.empty;
    });

    final first = states.first;

    expect(first, 'a');

  });

  test('`states.first` failure', () {

    final states = States<String>((onData) {
      return Disposable.empty;
    });

    expect(
      () {
        states.first;
      },
      throwsA(
        isA<StatesLatestValueNotReplayError<String>>()
          .having(
            (error) => error.toString(),
            'description',
            contains("Instance of 'States<String>' should replay latest value synchronousy when observed"),
          )
      ),
    );
  });
}
