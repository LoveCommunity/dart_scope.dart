
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../toolbox/driver_tester.dart';

void main() {

  test('create driver common', () {

    final driver = Driver<String>((onData) {
      onData('a');
      return Disposable.empty;
    });

    final tester = DriverTester(
      driver,
    );

    expect(tester.recorded, []);
    tester.startDrive();
    expect(tester.recorded, [
      'a',
    ]);

    tester.stopDrive();

  });

  test('create driver observation dispose', () {

    int invokes = 0;

    final driver = Driver<String>((onData) {
      onData('a');
      return Disposable(() {
        invokes += 1;
      });
    });

    final observation = driver.drive((data) {});

    expect(invokes, 0);
    observation.dispose();
    expect(invokes, 1);
  });

  test('create driver not recieve data after disposed', () async {

    final driver = Driver<String>((onData) {
      onData('a');
      Future(() => onData('b'));
      return Disposable.empty;
    });

    final tester = DriverTester(
      driver,
    );

    tester.startDrive();

    expect(tester.recorded, [
      'a',
    ]);

    tester.stopDrive();

    await Future(() {});
    expect(tester.recorded, [
      'a',
    ]);

  });

}
