// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states_computed_test.dart';

// **************************************************************************
// StatesComputedTestGenerator
// **************************************************************************

void _main() {
  test('States.computed initial emit', () {
    final states1 = States<String>((setState) {
      setState('1a');
      return Disposable.empty;
    });

    final states2 = States<String>((setState) {
      setState('2a');
      return Disposable.empty;
    });

    final computed = States.computed<String, String>(
      states: [
        states1,
        states2,
      ],
      compute: (items) => '${items[0]}|${items[1]}',
    );

    final tester = StatesTester(
      computed,
    );

    expect(tester.recorded, <String>[]);

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a']);

    tester.stopObserve();
  });

  test('States.computed2 initial emit', () {
    final states1 = States<String>((setState) {
      setState('1a');
      return Disposable.empty;
    });

    final states2 = States<String>((setState) {
      setState('2a');
      return Disposable.empty;
    });

    final computed = States.computed2<String, String, String>(
      states1: states1,
      states2: states2,
      compute: (it1, it2) => '$it1|$it2',
    );

    final tester = StatesTester(
      computed,
    );

    expect(tester.recorded, <String>[]);

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a']);

    tester.stopObserve();
  });

  test('States.computed3 initial emit', () {
    final states1 = States<String>((setState) {
      setState('1a');
      return Disposable.empty;
    });

    final states2 = States<String>((setState) {
      setState('2a');
      return Disposable.empty;
    });

    final states3 = States<String>((setState) {
      setState('3a');
      return Disposable.empty;
    });

    final computed = States.computed3<String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      compute: (it1, it2, it3) => '$it1|$it2|$it3',
    );

    final tester = StatesTester(
      computed,
    );

    expect(tester.recorded, <String>[]);

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a']);

    tester.stopObserve();
  });

  test('States.computed emit latest combined value when a source emit',
      () async {
    final states1 = States<String>((setState) {
      setState('1a');
      return Disposable.empty;
    });

    final states2 = States<String>((setState) {
      setState('2a');
      Future(() => setState('2b'));
      return Disposable.empty;
    });

    final computed = States.computed<String, String>(
      states: [
        states1,
        states2,
      ],
      compute: (items) => '${items[0]}|${items[1]}',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a', '1a|2b']);

    tester.stopObserve();
  });

  test('States.computed2 emit latest combined value when a source emit',
      () async {
    final states1 = States<String>((setState) {
      setState('1a');
      return Disposable.empty;
    });

    final states2 = States<String>((setState) {
      setState('2a');
      Future(() => setState('2b'));
      return Disposable.empty;
    });

    final computed = States.computed2<String, String, String>(
      states1: states1,
      states2: states2,
      compute: (it1, it2) => '$it1|$it2',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a', '1a|2b']);

    tester.stopObserve();
  });

  test('States.computed3 emit latest combined value when a source emit',
      () async {
    final states1 = States<String>((setState) {
      setState('1a');
      return Disposable.empty;
    });

    final states2 = States<String>((setState) {
      setState('2a');
      return Disposable.empty;
    });

    final states3 = States<String>((setState) {
      setState('3a');
      Future(() => setState('3b'));
      return Disposable.empty;
    });

    final computed = States.computed3<String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      compute: (it1, it2, it3) => '$it1|$it2|$it3',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a', '1a|2a|3b']);

    tester.stopObserve();
  });

  test(
      'States.computed dispose observation will dispose all source observations',
      () {
    final invokes = <String>[];
    final states1 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose1');
      });
    });

    final states2 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose2');
      });
    });

    final computed = States.computed<String, String>(
      states: [
        states1,
        states2,
      ],
      compute: (items) => '${items[0]}|${items[1]}',
    );

    final observation = computed.observe((_) {});

    expect(invokes, <String>[]);

    observation.dispose();

    expect(invokes, <String>['dispose2', 'dispose1']);
  });

  test(
      'States.computed2 dispose observation will dispose all source observations',
      () {
    final invokes = <String>[];
    final states1 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose1');
      });
    });

    final states2 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose2');
      });
    });

    final computed = States.computed2<String, String, String>(
      states1: states1,
      states2: states2,
      compute: (it1, it2) => '$it1|$it2',
    );

    final observation = computed.observe((_) {});

    expect(invokes, <String>[]);

    observation.dispose();

    expect(invokes, <String>['dispose2', 'dispose1']);
  });

  test(
      'States.computed3 dispose observation will dispose all source observations',
      () {
    final invokes = <String>[];
    final states1 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose1');
      });
    });

    final states2 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose2');
      });
    });

    final states3 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose3');
      });
    });

    final computed = States.computed3<String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      compute: (it1, it2, it3) => '$it1|$it2|$it3',
    );

    final observation = computed.observe((_) {});

    expect(invokes, <String>[]);

    observation.dispose();

    expect(invokes, <String>['dispose3', 'dispose2', 'dispose1']);
  });

  test('States.computed will not emit data after observation disposed',
      () async {
    final states1 = States<String>((setState) {
      setState('1a');
      return Disposable.empty;
    });

    final states2 = States<String>((setState) {
      setState('2a');
      Future(() => setState('2b'));
      return Disposable.empty;
    });

    final computed = States.computed<String, String>(
      states: [
        states1,
        states2,
      ],
      compute: (items) => '${items[0]}|${items[1]}',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, <String>['1a|2a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a']);
  });

  test('States.computed2 will not emit data after observation disposed',
      () async {
    final states1 = States<String>((setState) {
      setState('1a');
      return Disposable.empty;
    });

    final states2 = States<String>((setState) {
      setState('2a');
      Future(() => setState('2b'));
      return Disposable.empty;
    });

    final computed = States.computed2<String, String, String>(
      states1: states1,
      states2: states2,
      compute: (it1, it2) => '$it1|$it2',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, <String>['1a|2a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a']);
  });

  test('States.computed3 will not emit data after observation disposed',
      () async {
    final states1 = States<String>((setState) {
      setState('1a');
      return Disposable.empty;
    });

    final states2 = States<String>((setState) {
      setState('2a');
      return Disposable.empty;
    });

    final states3 = States<String>((setState) {
      setState('3a');
      Future(() => setState('3b'));
      return Disposable.empty;
    });

    final computed = States.computed3<String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      compute: (it1, it2, it3) => '$it1|$it2|$it3',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, <String>['1a|2a|3a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a']);
  });
}
