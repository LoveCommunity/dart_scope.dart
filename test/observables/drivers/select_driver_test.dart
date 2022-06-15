
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../toolbox/driver_tester.dart';

void main() {
  
  test('`driver.select` default equals', () {

    final driver = Driver<String>((onData) {
      onData('a');
      onData('a');
      onData('b');
      onData('b');
      return Disposable.empty;
    });

    final selectDriver = driver
      .select((it) => '1$it');

    final tester = DriverTester(
      selectDriver,
    );

    expect(tester.recorded, []);
    tester.startDrive();
    expect(tester.recorded, [
      '1a',
      '1b',
    ]);

    tester.stopDrive();

  });

  test('`driver.select` custom equals', () {

    final driver = Driver<String>((onData) {
      onData('a');
      onData('b');
      onData('aa');
      onData('bb');
      return Disposable.empty;
    });

    final selectDriver = driver
      .select<String>(
        (it) => '1$it',
        equals: (it1, it2) => it1.length == it2.length,
      );

    final tester = DriverTester(
      selectDriver,
    );

    expect(tester.recorded, []);
    tester.startDrive();
    expect(tester.recorded, [
      '1a',
      '1aa',
    ]);

    tester.stopDrive();

  });
}
