

import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../toolbox/driver_tester.dart';

void main() {

  test('`driver.distinct` default equals', () {

    final driver = Driver<String>((onData) {
      onData('a');
      onData('a');
      onData('b');
      onData('b');
      return Disposable.empty;
    });

    final distinctDriver = driver.distinct();

    final tester = DriverTester(
      distinctDriver,
    );

    expect(tester.recorded, []);
    tester.startDrive();
    expect(tester.recorded, [
      'a',
      'b',
    ]);

    tester.stopDrive();

  });

  test('`driver.distinct` custom equals', () {

    final driver = Driver<String>((onData) {
      onData('a');
      onData('b');
      onData('aa');
      onData('bb');
      return Disposable.empty;
    });

    final distinctDriver = driver
      .distinct((it1, it2) => it1.length == it2.length);

    final tester = DriverTester(
      distinctDriver,
    );

    expect(tester.recorded, []);
    tester.startDrive();
    expect(tester.recorded, [
      'a',
      'aa',
    ]);

    tester.stopDrive();

  });
}
