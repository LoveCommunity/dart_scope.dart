// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_combine_test.dart';

// **************************************************************************
// DriverCombineTestGenerator
// **************************************************************************

void _main() {
  test('`Driver.combine` initial emit', () {
    final driver1 = Driver<Object?>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final driver2 = Driver<Object?>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final combine = Driver<String>.combine(
      children: [
        driver1,
        driver2,
      ],
      combiner: (items) => '${items[0]}|${items[1]}',
    );

    final tester = DriverTester(
      combine,
    );

    expect(tester.recorded, []);

    tester.startDrive();

    expect(tester.recorded, ['1a|2a']);

    tester.stopDrive();
  });

  test('`Driver.combine` emit latest combined value when a child emit',
      () async {
    final driver1 = Driver<Object?>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final driver2 = Driver<Object?>((onData) {
      onData('2a');
      Future(() => onData('2b'));
      return Disposable.empty;
    });

    final combine = Driver<String>.combine(
      children: [
        driver1,
        driver2,
      ],
      combiner: (items) => '${items[0]}|${items[1]}',
    );

    final tester = DriverTester(
      combine,
    );

    tester.startDrive();

    expect(tester.recorded, ['1a|2a']);

    await Future(() {});

    expect(tester.recorded, ['1a|2a', '1a|2b']);

    tester.stopDrive();
  });

  test(
      '`Driver.combine` dispose observation will dispose all children observations',
      () {
    final List<String> invokes = [];

    final driver1 = Driver<Object?>((onData) {
      return Disposable(() {
        invokes.add('dispose1');
      });
    });

    final driver2 = Driver<Object?>((onData) {
      return Disposable(() {
        invokes.add('dispose2');
      });
    });

    final combine = Driver<String>.combine(
      children: [
        driver1,
        driver2,
      ],
      combiner: (items) => '${items[0]}|${items[1]}',
    );

    final observation = combine.drive((data) {});

    expect(invokes, []);

    observation.dispose();

    expect(invokes, ['dispose2', 'dispose1']);
  });

  test('`Driver.combine` will not emit data after observation disposed',
      () async {
    final driver1 = Driver<Object?>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final driver2 = Driver<Object?>((onData) {
      onData('2a');
      Future(() => onData('2b'));
      return Disposable.empty;
    });

    final combine = Driver<String>.combine(
      children: [
        driver1,
        driver2,
      ],
      combiner: (items) => '${items[0]}|${items[1]}',
    );

    final tester = DriverTester(
      combine,
    );

    tester.startDrive();

    tester.stopDrive();

    expect(tester.recorded, ['1a|2a']);

    await Future(() {});

    expect(tester.recorded, ['1a|2a']);
  });
}
