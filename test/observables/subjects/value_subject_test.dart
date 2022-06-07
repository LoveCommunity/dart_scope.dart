
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../toolbox/observable_tester.dart';

void main() {

  test('value subject initial value', () {

    final subject = ValueSubject<String>('a');

    expect(subject.value, 'a');

    subject.dispose();

  });

  test('value subject replay initial value', () {

    final subject = ValueSubject<String>('a');

    final tester = ObservableTester(
      subject,
    );

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      'a',
    ]);

    tester.stopObserve();

    subject.dispose();

  });

  test('value subject update value by call `onData`', () {

    final subject = ValueSubject<String>('a');
    
    expect(subject.value, 'a');
    subject.onData('b');
    expect(subject.value, 'b');

    subject.dispose();

  });

  test('value subject updata value by call `set value`', () {

    final subject = ValueSubject<String>('a');

    expect(subject.value, 'a');
    subject.value = 'b';
    expect(subject.value, 'b');

    subject.dispose();

  });

  test('value subject forward data by call `onData`', () {

    final subject = ValueSubject<String>('a');

    final tester = ObservableTester(
      subject,
    );
    
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

  test('value subject forward data by call `set value`', () {

    final subject = ValueSubject<String>('a');

    final tester = ObservableTester(
      subject,
    );

    tester.startObserve();

    expect(tester.recorded, [
      'a',
    ]);
    subject.value = 'b';
    expect(tester.recorded, [
      'a',
      'b',
    ]);

    tester.stopObserve();
    subject.dispose();

  });

  test('value subject replay current value', () {

    final subject = ValueSubject<String>('a');

    final tester = ObservableTester(
      subject,
    );

    subject.onData('b');

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      'b',
    ]);

    tester.stopObserve();
    subject.dispose();

  });

  test("value subject won't forward data after observation disposed", () {

    final subject = ValueSubject<String>('a');

    final tester = ObservableTester(
      subject,
    );

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

  test("value subject won't forward data after subject is disposed", () {

    final subject = ValueSubject<String>('a');

    final tester = ObservableTester(
      subject,
    );

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

  test('value subject throws error when been observed after it is disposed', () {
    
    final subject = ValueSubject<String>('a');

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
          )
      ),
    );

  });

}
