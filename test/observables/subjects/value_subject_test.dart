
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../shared/observable_tester.dart';

void main() {

  test('`ValueSubject` initial value', () {

    final subject = ValueSubject<String>('a');

    expect(subject.value, 'a');

    subject.dispose();

  });

  test('`ValueSubject` replay initial value', () {

    final subject = ValueSubject<String>('a');

    final tester = ObservableTester(
      subject,
    );

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, [
      'a',
    ]);

    tester.stopObserve();

    subject.dispose();

  });

  test('`ValueSubject` update value by call `onData`', () {

    final subject = ValueSubject<String>('a');
    
    expect(subject.value, 'a');
    subject.onData('b');
    expect(subject.value, 'b');

    subject.dispose();

  });

  test('`ValueSubject` updata value by call `set value`', () {

    final subject = ValueSubject<String>('a');

    expect(subject.value, 'a');
    subject.value = 'b';
    expect(subject.value, 'b');

    subject.dispose();

  });

  test('`ValueSubject` forward data by call `onData`', () {

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

  test('`ValueSubject` forward data by call `set value`', () {

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

  test('`ValueSubject` replay current value', () {

    final subject = ValueSubject<String>('a');

    final tester = ObservableTester(
      subject,
    );

    subject.onData('b');

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, [
      'b',
    ]);

    tester.stopObserve();
    subject.dispose();

  });

  test("`ValueSubject` won't forward data after observation disposed", () {

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

  test("`ValueSubject` won't forward data after subject is disposed", () {

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

  test('`ValueSubject` throws error when been observed after it is disposed', () {
    
    final subject = ValueSubject<String>('a');

    subject.dispose();

    expect(
      () {
        subject.observe((_) {});
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
