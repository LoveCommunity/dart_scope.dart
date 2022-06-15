
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

void main() {

  test('`driver.first` success', () {

    final driver = Driver<String>((onData) {
      onData('a');
      onData('b');
      onData('c');
      return Disposable.empty;
    });

    final first = driver.first;

    expect(first, 'a');

  });

  test('`driver.first` failure', () {

    final driver = Driver<String>((onData) {
      return Disposable.empty;
    });

    expect(
      () {
        driver.first;
      },
      throwsA(
        isA<DriverLatestValueNotReplayError<String>>()
          .having(
            (error) => error.toString(),
            'description',
            contains("Instance of 'Driver<String>' should replay latest value synchronousy when observed"),
          )
      ),
    );
  });
}
