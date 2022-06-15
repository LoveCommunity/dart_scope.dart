
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../toolbox/driver_tester.dart';

void main() {

  test('`driver.cache` connect when observers increase to one', () {

    int invokes = 0;

    final driver = Driver<String>((onData) {
      onData('a');
      invokes += 1;
      return Disposable.empty;
    });

    final cacheDriver = driver.cache();

    expect(invokes, 0);
    final observation1 = cacheDriver.drive((data) {});
    expect(invokes, 1);
    final observation2 = cacheDriver.drive((data) {});
    expect(invokes, 1);

    observation1.dispose();
    observation2.dispose();

  });

  test('`driver.cache` disconnect when observers decrease to zero', () {

    int invokes = 0;

    final driver = Driver<String>((onData) {
      onData('a');
      return Disposable(() {
        invokes += 1;
      });
    });

    final cacheDriver = driver.cache();

    final observation1 = cacheDriver.drive((data) {});
    final observation2 = cacheDriver.drive((data) {});

    expect(invokes, 0);
    observation1.dispose();
    expect(invokes, 0);
    observation2.dispose();
    expect(invokes, 1);

  });

  test('`driver.cache` forward data to observers', () async {

    final driver = Driver<String>((onData) {
      onData('a');
      Future(() => onData('b'));
      return Disposable.empty;
    });

    final cacheDriver = driver.cache();

    final tester1 = DriverTester(
      cacheDriver,
    ); 

    final tester2 = DriverTester(
      cacheDriver,
    ); 


    tester1.startDrive();
    tester2.startDrive();
    
    expect(tester1.recorded, [
      'a',
    ]);
    expect(tester2.recorded, [
      'a',
    ]);
    await Future(() {});
    expect(tester1.recorded, [
      'a',
      'b',
    ]);
    expect(tester2.recorded, [
      'a',
      'b',
    ]);

    tester1.stopDrive();
    tester2.stopDrive();

  });

  test('`driver.cache` replay data to observers', () {

    final driver = Driver<String>((onData) {
      onData('a');
      onData('b');
      onData('c');
      return Disposable.empty;
    });

    final cacheDriver = driver.cache();

    final tester = DriverTester(
      cacheDriver,
    );

    final observation  = cacheDriver.drive((data) {});

    expect(tester.recorded, []);
    tester.startDrive();
    expect(tester.recorded, [
      'c',
    ]);

    tester.stopDrive();
    observation.dispose();

  });

}
