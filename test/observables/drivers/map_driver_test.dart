
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../toolbox/driver_tester.dart';

void main() {

  test('map driver', () {

    final driver = Driver<String>((onData) {
      onData('a');
      onData('ab');
      onData('abc');
      return Disposable.empty;
    });

    final mapDriver = driver
      .map<int>((data) => data.length);

    final tester = DriverTester(
      mapDriver,
    );

    expect(tester.recorded, []);
    tester.startDrive();
    expect(tester.recorded, [
      1,
      2,
      3,
    ]);

    tester.stopDrive();

  });
}
