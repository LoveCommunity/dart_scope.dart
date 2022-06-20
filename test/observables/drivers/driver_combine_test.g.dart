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

  test('`Driver.combine2` initial emit', () {
    final driver1 = Driver<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final driver2 = Driver<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final combine = Driver.combine2<String, String, String>(
      child1: driver1,
      child2: driver2,
      combiner: (it1, it2) => '$it1|$it2',
    );

    final tester = DriverTester(
      combine,
    );

    expect(tester.recorded, []);

    tester.startDrive();

    expect(tester.recorded, ['1a|2a']);

    tester.stopDrive();
  });

  test('`Driver.combine3` initial emit', () {
    final driver1 = Driver<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final driver2 = Driver<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final driver3 = Driver<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final combine = Driver.combine3<String, String, String, String>(
      child1: driver1,
      child2: driver2,
      child3: driver3,
      combiner: (it1, it2, it3) => '$it1|$it2|$it3',
    );

    final tester = DriverTester(
      combine,
    );

    expect(tester.recorded, []);

    tester.startDrive();

    expect(tester.recorded, ['1a|2a|3a']);

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

  test('`Driver.combine2` emit latest combined value when a child emit',
      () async {
    final driver1 = Driver<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final driver2 = Driver<String>((onData) {
      onData('2a');
      Future(() => onData('2b'));
      return Disposable.empty;
    });

    final combine = Driver.combine2<String, String, String>(
      child1: driver1,
      child2: driver2,
      combiner: (it1, it2) => '$it1|$it2',
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

  test('`Driver.combine3` emit latest combined value when a child emit',
      () async {
    final driver1 = Driver<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final driver2 = Driver<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final driver3 = Driver<String>((onData) {
      onData('3a');
      Future(() => onData('3b'));
      return Disposable.empty;
    });

    final combine = Driver.combine3<String, String, String, String>(
      child1: driver1,
      child2: driver2,
      child3: driver3,
      combiner: (it1, it2, it3) => '$it1|$it2|$it3',
    );

    final tester = DriverTester(
      combine,
    );

    tester.startDrive();

    expect(tester.recorded, ['1a|2a|3a']);

    await Future(() {});

    expect(tester.recorded, ['1a|2a|3a', '1a|2a|3b']);

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

  test(
      '`Driver.combine2` dispose observation will dispose all children observations',
      () {
    final List<String> invokes = [];

    final driver1 = Driver<String>((onData) {
      return Disposable(() {
        invokes.add('dispose1');
      });
    });

    final driver2 = Driver<String>((onData) {
      return Disposable(() {
        invokes.add('dispose2');
      });
    });

    final combine = Driver.combine2<String, String, String>(
      child1: driver1,
      child2: driver2,
      combiner: (it1, it2) => '$it1|$it2',
    );

    final observation = combine.drive((data) {});

    expect(invokes, []);

    observation.dispose();

    expect(invokes, ['dispose2', 'dispose1']);
  });

  test(
      '`Driver.combine3` dispose observation will dispose all children observations',
      () {
    final List<String> invokes = [];

    final driver1 = Driver<String>((onData) {
      return Disposable(() {
        invokes.add('dispose1');
      });
    });

    final driver2 = Driver<String>((onData) {
      return Disposable(() {
        invokes.add('dispose2');
      });
    });

    final driver3 = Driver<String>((onData) {
      return Disposable(() {
        invokes.add('dispose3');
      });
    });

    final combine = Driver.combine3<String, String, String, String>(
      child1: driver1,
      child2: driver2,
      child3: driver3,
      combiner: (it1, it2, it3) => '$it1|$it2|$it3',
    );

    final observation = combine.drive((data) {});

    expect(invokes, []);

    observation.dispose();

    expect(invokes, ['dispose3', 'dispose2', 'dispose1']);
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

  test('`Driver.combine2` will not emit data after observation disposed',
      () async {
    final driver1 = Driver<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final driver2 = Driver<String>((onData) {
      onData('2a');
      Future(() => onData('2b'));
      return Disposable.empty;
    });

    final combine = Driver.combine2<String, String, String>(
      child1: driver1,
      child2: driver2,
      combiner: (it1, it2) => '$it1|$it2',
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

  test('`Driver.combine3` will not emit data after observation disposed',
      () async {
    final driver1 = Driver<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final driver2 = Driver<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final driver3 = Driver<String>((onData) {
      onData('3a');
      Future(() => onData('3b'));
      return Disposable.empty;
    });

    final combine = Driver.combine3<String, String, String, String>(
      child1: driver1,
      child2: driver2,
      child3: driver3,
      combiner: (it1, it2, it3) => '$it1|$it2|$it3',
    );

    final tester = DriverTester(
      combine,
    );

    tester.startDrive();

    tester.stopDrive();

    expect(tester.recorded, ['1a|2a|3a']);

    await Future(() {});

    expect(tester.recorded, ['1a|2a|3a']);
  });
}
