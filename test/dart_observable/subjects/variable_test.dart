
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../shared/observable_tester.dart';

void main() {

  test('`Variable` initial value', () {

    final variable = Variable<String>('a');

    expect(variable.value, 'a');

    variable.dispose();

  });

  test('`Variable` replay initial value', () {

    final variable = Variable<String>('a');

    final tester = ObservableTester(
      variable,
    );

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, [
      'a',
    ]);

    tester.stopObserve();

    variable.dispose();

  });

  test('`Variable` update value by call `onData`', () {

    final variable = Variable<String>('a');
    
    expect(variable.value, 'a');
    variable.onData('b');
    expect(variable.value, 'b');

    variable.dispose();

  });

  test('`Variable` update value by call `set value`', () {

    final variable = Variable<String>('a');

    expect(variable.value, 'a');
    variable.value = 'b';
    expect(variable.value, 'b');

    variable.dispose();

  });

  test('`Variable` forward data by call `onData`', () {

    final variable = Variable<String>('a');

    final tester = ObservableTester(
      variable,
    );
    
    tester.startObserve();
    
    expect(tester.recorded, [
      'a',
    ]);
    variable.onData('b');
    expect(tester.recorded, [
      'a',
      'b',
    ]);

    tester.stopObserve();
    variable.dispose();

  });

  test('`Variable` forward data by call `set value`', () {

    final variable = Variable<String>('a');

    final tester = ObservableTester(
      variable,
    );

    tester.startObserve();

    expect(tester.recorded, [
      'a',
    ]);
    variable.value = 'b';
    expect(tester.recorded, [
      'a',
      'b',
    ]);

    tester.stopObserve();
    variable.dispose();

  });

  test('`Variable` replay current value', () {

    final variable = Variable<String>('a');

    final tester = ObservableTester(
      variable,
    );

    variable.onData('b');

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, [
      'b',
    ]);

    tester.stopObserve();
    variable.dispose();

  });

  test("`Variable` won't forward data after observation disposed", () {

    final variable = Variable<String>('a');

    final tester = ObservableTester(
      variable,
    );

    tester.startObserve();
    tester.stopObserve();

    expect(tester.recorded, [
      'a',
    ]);
    variable.onData('b');
    expect(tester.recorded, [
      'a',
    ]);

    variable.dispose();

  });

  test("`Variable` won't forward data after variable is disposed", () {

    final variable = Variable<String>('a');

    final tester = ObservableTester(
      variable,
    );

    tester.startObserve();

    variable.dispose();

    expect(tester.recorded, [
      'a',
    ]);
    variable.onData('b');
    expect(tester.recorded, [
      'a',
    ]);

    tester.stopObserve();

  });

  test('`Variable` throws error when been observed after it is disposed', () {
    
    final variable = Variable<String>('a');

    variable.dispose();

    expect(
      () {
        variable.observe((_) {});
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
