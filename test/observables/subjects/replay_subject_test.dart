
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../toolbox/observable_tester.dart';

void main() {

  test('replay subject replay all data when emit times is less than buffer size', () {

    final subject = ReplaySubject(bufferSize: 3);

    final tester = ObservableTester(
      subject,
    );

    subject.onData('a');
    subject.onData('b');

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      'a',
      'b',
    ]);

    tester.stopObserve();

    subject.dispose();

  });

  test('replay subject replay all data when emit times is equals to buffer size', () {

    final subject = ReplaySubject(bufferSize: 3);

    final tester = ObservableTester(
      subject,
    );

    subject.onData('a');
    subject.onData('b');
    subject.onData('c');

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      'a',
      'b',
      'c',
    ]);

    tester.stopObserve();

    subject.dispose();

  });

  test("replay subject replay buffer size's data when emit times is more than buffer size", () {

    final subject = ReplaySubject(bufferSize: 3);

    final tester = ObservableTester(
      subject,
    );

    subject.onData('a');
    subject.onData('b');
    subject.onData('c');
    subject.onData('d');

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      'b',
      'c',
      'd',
    ]);

    tester.stopObserve();

    subject.dispose();

  });

  test('replay subject forward data after observed', () {

    final subject = ReplaySubject(bufferSize: 3);

    final tester = ObservableTester(
      subject,
    );

    subject.onData('a');

    tester.startObserve();

    expect(tester.recorded, [
      'a',
    ]);
    subject.onData('b');
    expect(tester.recorded, [
      'a',
      'b',
    ]);

    tester.stopObserve();

    subject.dispose();

  });

  test("replay subject won't forward data after observation is disposed", () {

    final subject = ReplaySubject(bufferSize: 3);

    final tester = ObservableTester(
      subject,
    );

    subject.onData('a');

    tester.startObserve();
    tester.stopObserve();

    expect(tester.recorded, [
      'a',
    ]);
    subject.onData('b');
    expect(tester.recorded, [
      'a',
    ]);

    subject.dispose();

  });

  test("replay subject won't forward data after subject is disposed", () {

    final subject = ReplaySubject(bufferSize: 3);

    final tester = ObservableTester(
      subject,
    );

    subject.onData('a');

    tester.startObserve();
    subject.dispose();

    expect(tester.recorded, [
      'a',
    ]);
    subject.onData('b');
    expect(tester.recorded, [
      'a',
    ]);

    tester.stopObserve();

  });

  test('replay subject throws error when been observed after subject is disposed', () {

    final subject = ReplaySubject(bufferSize: 3);
    subject.dispose();
    
    expect(
      () {
        subject.observe((data) {});
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
