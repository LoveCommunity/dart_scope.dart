
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../shared/observable_tester.dart';

void main() {

  test('`Replayer` replay all data when emit times is less than buffer size', () {

    final replayer = Replayer<String>(bufferSize: 3);

    final tester = ObservableTester(
      replayer,
    );

    replayer.onData('a');
    replayer.onData('b');

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, [
      'a',
      'b',
    ]);

    tester.stopObserve();

    replayer.dispose();

  });

  test('`Replayer` replay all data when emit times is equals to buffer size', () {

    final replayer = Replayer<String>(bufferSize: 3);

    final tester = ObservableTester(
      replayer,
    );

    replayer.onData('a');
    replayer.onData('b');
    replayer.onData('c');

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, [
      'a',
      'b',
      'c',
    ]);

    tester.stopObserve();

    replayer.dispose();

  });

  test("`Replayer` replay buffer size's data when emit times is more than buffer size", () {

    final replayer = Replayer<String>(bufferSize: 3);

    final tester = ObservableTester(
      replayer,
    );

    replayer.onData('a');
    replayer.onData('b');
    replayer.onData('c');
    replayer.onData('d');

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, [
      'b',
      'c',
      'd',
    ]);

    tester.stopObserve();

    replayer.dispose();

  });

  test("`Replayer` with single element buffer", () {

    final replayer = Replayer<String>(bufferSize: 1);

    final tester = ObservableTester(
      replayer,
    );

    replayer.onData('a');
    replayer.onData('b');
    replayer.onData('c');
    replayer.onData('d');

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, [
      'd',
    ]);


    tester.stopObserve();

    replayer.dispose();

  });

  test('`Replayer` forward data after observed', () {

    final replayer = Replayer<String>(bufferSize: 3);

    final tester = ObservableTester(
      replayer,
    );

    replayer.onData('a');

    tester.startObserve();

    expect(tester.recorded, [
      'a',
    ]);
    replayer.onData('b');
    expect(tester.recorded, [
      'a',
      'b',
    ]);

    tester.stopObserve();

    replayer.dispose();

  });

  test("`Replayer` won't forward data after observation is disposed", () {

    final replayer = Replayer<String>(bufferSize: 3);

    final tester = ObservableTester(
      replayer,
    );

    replayer.onData('a');

    tester.startObserve();
    tester.stopObserve();

    expect(tester.recorded, [
      'a',
    ]);
    replayer.onData('b');
    expect(tester.recorded, [
      'a',
    ]);

    replayer.dispose();

  });

  test("`Replayer` won't forward data after replayer is disposed", () {

    final replayer = Replayer<String>(bufferSize: 3);

    final tester = ObservableTester(
      replayer,
    );

    replayer.onData('a');

    tester.startObserve();
    replayer.dispose();

    expect(tester.recorded, [
      'a',
    ]);
    replayer.onData('b');
    expect(tester.recorded, [
      'a',
    ]);

    tester.stopObserve();

  });

  test('`Replayer` throws error when been observed after replayer is disposed', () {

    final replayer = Replayer<String>(bufferSize: 3);
    replayer.dispose();
    
    expect(
      () {
        replayer.observe((_) {});
      },
      throwsA(
        isA<StateError>()
          .having(
            (error) => error.toString(),
            'description',
            contains("Subject is disposed and can't be observed."),
          ),
      ),
    );

  });

}
