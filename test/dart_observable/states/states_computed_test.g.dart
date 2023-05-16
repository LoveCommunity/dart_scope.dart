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

  test('States.computed4 initial emit', () {
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

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final computed = States.computed4<String, String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      compute: (it1, it2, it3, it4) => '$it1|$it2|$it3|$it4',
    );

    final tester = StatesTester(
      computed,
    );

    expect(tester.recorded, <String>[]);

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a']);

    tester.stopObserve();
  });

  test('States.computed5 initial emit', () {
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

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final computed =
        States.computed5<String, String, String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      compute: (it1, it2, it3, it4, it5) => '$it1|$it2|$it3|$it4|$it5',
    );

    final tester = StatesTester(
      computed,
    );

    expect(tester.recorded, <String>[]);

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a']);

    tester.stopObserve();
  });

  test('States.computed6 initial emit', () {
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

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      return Disposable.empty;
    });

    final computed = States.computed6<String, String, String, String, String,
        String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      compute: (it1, it2, it3, it4, it5, it6) =>
          '$it1|$it2|$it3|$it4|$it5|$it6',
    );

    final tester = StatesTester(
      computed,
    );

    expect(tester.recorded, <String>[]);

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a']);

    tester.stopObserve();
  });

  test('States.computed7 initial emit', () {
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

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      return Disposable.empty;
    });

    final states7 = States<String>((setState) {
      setState('7a');
      return Disposable.empty;
    });

    final computed = States.computed7<String, String, String, String, String,
        String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      states7: states7,
      compute: (it1, it2, it3, it4, it5, it6, it7) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7',
    );

    final tester = StatesTester(
      computed,
    );

    expect(tester.recorded, <String>[]);

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a']);

    tester.stopObserve();
  });

  test('States.computed8 initial emit', () {
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

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      return Disposable.empty;
    });

    final states7 = States<String>((setState) {
      setState('7a');
      return Disposable.empty;
    });

    final states8 = States<String>((setState) {
      setState('8a');
      return Disposable.empty;
    });

    final computed = States.computed8<String, String, String, String, String,
        String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      states7: states7,
      states8: states8,
      compute: (it1, it2, it3, it4, it5, it6, it7, it8) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8',
    );

    final tester = StatesTester(
      computed,
    );

    expect(tester.recorded, <String>[]);

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a']);

    tester.stopObserve();
  });

  test('States.computed9 initial emit', () {
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

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      return Disposable.empty;
    });

    final states7 = States<String>((setState) {
      setState('7a');
      return Disposable.empty;
    });

    final states8 = States<String>((setState) {
      setState('8a');
      return Disposable.empty;
    });

    final states9 = States<String>((setState) {
      setState('9a');
      return Disposable.empty;
    });

    final computed = States.computed9<String, String, String, String, String,
        String, String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      states7: states7,
      states8: states8,
      states9: states9,
      compute: (it1, it2, it3, it4, it5, it6, it7, it8, it9) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9',
    );

    final tester = StatesTester(
      computed,
    );

    expect(tester.recorded, <String>[]);

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a']);

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

  test('States.computed4 emit latest combined value when a source emit',
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
      return Disposable.empty;
    });

    final states4 = States<String>((setState) {
      setState('4a');
      Future(() => setState('4b'));
      return Disposable.empty;
    });

    final computed = States.computed4<String, String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      compute: (it1, it2, it3, it4) => '$it1|$it2|$it3|$it4',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a', '1a|2a|3a|4b']);

    tester.stopObserve();
  });

  test('States.computed5 emit latest combined value when a source emit',
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
      return Disposable.empty;
    });

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      Future(() => setState('5b'));
      return Disposable.empty;
    });

    final computed =
        States.computed5<String, String, String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      compute: (it1, it2, it3, it4, it5) => '$it1|$it2|$it3|$it4|$it5',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a', '1a|2a|3a|4a|5b']);

    tester.stopObserve();
  });

  test('States.computed6 emit latest combined value when a source emit',
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
      return Disposable.empty;
    });

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      Future(() => setState('6b'));
      return Disposable.empty;
    });

    final computed = States.computed6<String, String, String, String, String,
        String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      compute: (it1, it2, it3, it4, it5, it6) =>
          '$it1|$it2|$it3|$it4|$it5|$it6',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a', '1a|2a|3a|4a|5a|6b']);

    tester.stopObserve();
  });

  test('States.computed7 emit latest combined value when a source emit',
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
      return Disposable.empty;
    });

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      return Disposable.empty;
    });

    final states7 = States<String>((setState) {
      setState('7a');
      Future(() => setState('7b'));
      return Disposable.empty;
    });

    final computed = States.computed7<String, String, String, String, String,
        String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      states7: states7,
      compute: (it1, it2, it3, it4, it5, it6, it7) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a', '1a|2a|3a|4a|5a|6a|7b']);

    tester.stopObserve();
  });

  test('States.computed8 emit latest combined value when a source emit',
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
      return Disposable.empty;
    });

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      return Disposable.empty;
    });

    final states7 = States<String>((setState) {
      setState('7a');
      return Disposable.empty;
    });

    final states8 = States<String>((setState) {
      setState('8a');
      Future(() => setState('8b'));
      return Disposable.empty;
    });

    final computed = States.computed8<String, String, String, String, String,
        String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      states7: states7,
      states8: states8,
      compute: (it1, it2, it3, it4, it5, it6, it7, it8) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a|8a', '1a|2a|3a|4a|5a|6a|7a|8b']);

    tester.stopObserve();
  });

  test('States.computed9 emit latest combined value when a source emit',
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
      return Disposable.empty;
    });

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      return Disposable.empty;
    });

    final states7 = States<String>((setState) {
      setState('7a');
      return Disposable.empty;
    });

    final states8 = States<String>((setState) {
      setState('8a');
      return Disposable.empty;
    });

    final states9 = States<String>((setState) {
      setState('9a');
      Future(() => setState('9b'));
      return Disposable.empty;
    });

    final computed = States.computed9<String, String, String, String, String,
        String, String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      states7: states7,
      states8: states8,
      states9: states9,
      compute: (it1, it2, it3, it4, it5, it6, it7, it8, it9) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a', '1a|2a|3a|4a|5a|6a|7a|8a|9b']);

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

  test(
      'States.computed4 dispose observation will dispose all source observations',
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

    final states4 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose4');
      });
    });

    final computed = States.computed4<String, String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      compute: (it1, it2, it3, it4) => '$it1|$it2|$it3|$it4',
    );

    final observation = computed.observe((_) {});

    expect(invokes, <String>[]);

    observation.dispose();

    expect(invokes, <String>['dispose4', 'dispose3', 'dispose2', 'dispose1']);
  });

  test(
      'States.computed5 dispose observation will dispose all source observations',
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

    final states4 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose4');
      });
    });

    final states5 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose5');
      });
    });

    final computed =
        States.computed5<String, String, String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      compute: (it1, it2, it3, it4, it5) => '$it1|$it2|$it3|$it4|$it5',
    );

    final observation = computed.observe((_) {});

    expect(invokes, <String>[]);

    observation.dispose();

    expect(invokes,
        <String>['dispose5', 'dispose4', 'dispose3', 'dispose2', 'dispose1']);
  });

  test(
      'States.computed6 dispose observation will dispose all source observations',
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

    final states4 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose4');
      });
    });

    final states5 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose5');
      });
    });

    final states6 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose6');
      });
    });

    final computed = States.computed6<String, String, String, String, String,
        String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      compute: (it1, it2, it3, it4, it5, it6) =>
          '$it1|$it2|$it3|$it4|$it5|$it6',
    );

    final observation = computed.observe((_) {});

    expect(invokes, <String>[]);

    observation.dispose();

    expect(invokes, <String>[
      'dispose6',
      'dispose5',
      'dispose4',
      'dispose3',
      'dispose2',
      'dispose1'
    ]);
  });

  test(
      'States.computed7 dispose observation will dispose all source observations',
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

    final states4 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose4');
      });
    });

    final states5 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose5');
      });
    });

    final states6 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose6');
      });
    });

    final states7 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose7');
      });
    });

    final computed = States.computed7<String, String, String, String, String,
        String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      states7: states7,
      compute: (it1, it2, it3, it4, it5, it6, it7) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7',
    );

    final observation = computed.observe((_) {});

    expect(invokes, <String>[]);

    observation.dispose();

    expect(invokes, <String>[
      'dispose7',
      'dispose6',
      'dispose5',
      'dispose4',
      'dispose3',
      'dispose2',
      'dispose1'
    ]);
  });

  test(
      'States.computed8 dispose observation will dispose all source observations',
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

    final states4 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose4');
      });
    });

    final states5 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose5');
      });
    });

    final states6 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose6');
      });
    });

    final states7 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose7');
      });
    });

    final states8 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose8');
      });
    });

    final computed = States.computed8<String, String, String, String, String,
        String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      states7: states7,
      states8: states8,
      compute: (it1, it2, it3, it4, it5, it6, it7, it8) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8',
    );

    final observation = computed.observe((_) {});

    expect(invokes, <String>[]);

    observation.dispose();

    expect(invokes, <String>[
      'dispose8',
      'dispose7',
      'dispose6',
      'dispose5',
      'dispose4',
      'dispose3',
      'dispose2',
      'dispose1'
    ]);
  });

  test(
      'States.computed9 dispose observation will dispose all source observations',
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

    final states4 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose4');
      });
    });

    final states5 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose5');
      });
    });

    final states6 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose6');
      });
    });

    final states7 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose7');
      });
    });

    final states8 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose8');
      });
    });

    final states9 = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose9');
      });
    });

    final computed = States.computed9<String, String, String, String, String,
        String, String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      states7: states7,
      states8: states8,
      states9: states9,
      compute: (it1, it2, it3, it4, it5, it6, it7, it8, it9) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9',
    );

    final observation = computed.observe((_) {});

    expect(invokes, <String>[]);

    observation.dispose();

    expect(invokes, <String>[
      'dispose9',
      'dispose8',
      'dispose7',
      'dispose6',
      'dispose5',
      'dispose4',
      'dispose3',
      'dispose2',
      'dispose1'
    ]);
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

  test('States.computed4 will not emit data after observation disposed',
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
      return Disposable.empty;
    });

    final states4 = States<String>((setState) {
      setState('4a');
      Future(() => setState('4b'));
      return Disposable.empty;
    });

    final computed = States.computed4<String, String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      compute: (it1, it2, it3, it4) => '$it1|$it2|$it3|$it4',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a']);
  });

  test('States.computed5 will not emit data after observation disposed',
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
      return Disposable.empty;
    });

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      Future(() => setState('5b'));
      return Disposable.empty;
    });

    final computed =
        States.computed5<String, String, String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      compute: (it1, it2, it3, it4, it5) => '$it1|$it2|$it3|$it4|$it5',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a']);
  });

  test('States.computed6 will not emit data after observation disposed',
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
      return Disposable.empty;
    });

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      Future(() => setState('6b'));
      return Disposable.empty;
    });

    final computed = States.computed6<String, String, String, String, String,
        String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      compute: (it1, it2, it3, it4, it5, it6) =>
          '$it1|$it2|$it3|$it4|$it5|$it6',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a']);
  });

  test('States.computed7 will not emit data after observation disposed',
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
      return Disposable.empty;
    });

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      return Disposable.empty;
    });

    final states7 = States<String>((setState) {
      setState('7a');
      Future(() => setState('7b'));
      return Disposable.empty;
    });

    final computed = States.computed7<String, String, String, String, String,
        String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      states7: states7,
      compute: (it1, it2, it3, it4, it5, it6, it7) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a']);
  });

  test('States.computed8 will not emit data after observation disposed',
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
      return Disposable.empty;
    });

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      return Disposable.empty;
    });

    final states7 = States<String>((setState) {
      setState('7a');
      return Disposable.empty;
    });

    final states8 = States<String>((setState) {
      setState('8a');
      Future(() => setState('8b'));
      return Disposable.empty;
    });

    final computed = States.computed8<String, String, String, String, String,
        String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      states7: states7,
      states8: states8,
      compute: (it1, it2, it3, it4, it5, it6, it7, it8) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a']);
  });

  test('States.computed9 will not emit data after observation disposed',
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
      return Disposable.empty;
    });

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      return Disposable.empty;
    });

    final states7 = States<String>((setState) {
      setState('7a');
      return Disposable.empty;
    });

    final states8 = States<String>((setState) {
      setState('8a');
      return Disposable.empty;
    });

    final states9 = States<String>((setState) {
      setState('9a');
      Future(() => setState('9b'));
      return Disposable.empty;
    });

    final computed = States.computed9<String, String, String, String, String,
        String, String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      states7: states7,
      states8: states8,
      states9: states9,
      compute: (it1, it2, it3, it4, it5, it6, it7, it8, it9) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a']);
  });

  test('States.computed default equals', () async {
    final states1 = States<String>((setState) {
      setState('1a');
      return Disposable.empty;
    });

    final states2 = States<String>((setState) {
      setState('2a');
      Future(() => setState('2a'));
      Future(() => setState('2b'));
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

  test('States.computed2 default equals', () async {
    final states1 = States<String>((setState) {
      setState('1a');
      return Disposable.empty;
    });

    final states2 = States<String>((setState) {
      setState('2a');
      Future(() => setState('2a'));
      Future(() => setState('2b'));
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

  test('States.computed3 default equals', () async {
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
      Future(() => setState('3a'));
      Future(() => setState('3b'));
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

  test('States.computed4 default equals', () async {
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

    final states4 = States<String>((setState) {
      setState('4a');
      Future(() => setState('4a'));
      Future(() => setState('4b'));
      Future(() => setState('4b'));
      return Disposable.empty;
    });

    final computed = States.computed4<String, String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      compute: (it1, it2, it3, it4) => '$it1|$it2|$it3|$it4',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a', '1a|2a|3a|4b']);

    tester.stopObserve();
  });

  test('States.computed5 default equals', () async {
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

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      Future(() => setState('5a'));
      Future(() => setState('5b'));
      Future(() => setState('5b'));
      return Disposable.empty;
    });

    final computed =
        States.computed5<String, String, String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      compute: (it1, it2, it3, it4, it5) => '$it1|$it2|$it3|$it4|$it5',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a', '1a|2a|3a|4a|5b']);

    tester.stopObserve();
  });

  test('States.computed6 default equals', () async {
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

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      Future(() => setState('6a'));
      Future(() => setState('6b'));
      Future(() => setState('6b'));
      return Disposable.empty;
    });

    final computed = States.computed6<String, String, String, String, String,
        String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      compute: (it1, it2, it3, it4, it5, it6) =>
          '$it1|$it2|$it3|$it4|$it5|$it6',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a', '1a|2a|3a|4a|5a|6b']);

    tester.stopObserve();
  });

  test('States.computed7 default equals', () async {
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

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      return Disposable.empty;
    });

    final states7 = States<String>((setState) {
      setState('7a');
      Future(() => setState('7a'));
      Future(() => setState('7b'));
      Future(() => setState('7b'));
      return Disposable.empty;
    });

    final computed = States.computed7<String, String, String, String, String,
        String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      states7: states7,
      compute: (it1, it2, it3, it4, it5, it6, it7) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a', '1a|2a|3a|4a|5a|6a|7b']);

    tester.stopObserve();
  });

  test('States.computed8 default equals', () async {
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

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      return Disposable.empty;
    });

    final states7 = States<String>((setState) {
      setState('7a');
      return Disposable.empty;
    });

    final states8 = States<String>((setState) {
      setState('8a');
      Future(() => setState('8a'));
      Future(() => setState('8b'));
      Future(() => setState('8b'));
      return Disposable.empty;
    });

    final computed = States.computed8<String, String, String, String, String,
        String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      states7: states7,
      states8: states8,
      compute: (it1, it2, it3, it4, it5, it6, it7, it8) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a|8a', '1a|2a|3a|4a|5a|6a|7a|8b']);

    tester.stopObserve();
  });

  test('States.computed9 default equals', () async {
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

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      return Disposable.empty;
    });

    final states7 = States<String>((setState) {
      setState('7a');
      return Disposable.empty;
    });

    final states8 = States<String>((setState) {
      setState('8a');
      return Disposable.empty;
    });

    final states9 = States<String>((setState) {
      setState('9a');
      Future(() => setState('9a'));
      Future(() => setState('9b'));
      Future(() => setState('9b'));
      return Disposable.empty;
    });

    final computed = States.computed9<String, String, String, String, String,
        String, String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      states7: states7,
      states8: states8,
      states9: states9,
      compute: (it1, it2, it3, it4, it5, it6, it7, it8, it9) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9',
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a', '1a|2a|3a|4a|5a|6a|7a|8a|9b']);

    tester.stopObserve();
  });

  test('States.computed custom equals', () async {
    final states1 = States<String>((setState) {
      setState('1a');
      return Disposable.empty;
    });

    final states2 = States<String>((setState) {
      setState('2a');
      Future(() => setState('2b'));
      Future(() => setState('2aa'));
      Future(() => setState('2bb'));
      return Disposable.empty;
    });

    final computed = States.computed<String, String>(
      states: [
        states1,
        states2,
      ],
      compute: (items) => '${items[0]}|${items[1]}',
      equals: (it1, it2) => it1.length == it2.length,
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a', '1a|2aa']);

    tester.stopObserve();
  });

  test('States.computed2 custom equals', () async {
    final states1 = States<String>((setState) {
      setState('1a');
      return Disposable.empty;
    });

    final states2 = States<String>((setState) {
      setState('2a');
      Future(() => setState('2b'));
      Future(() => setState('2aa'));
      Future(() => setState('2bb'));
      return Disposable.empty;
    });

    final computed = States.computed2<String, String, String>(
      states1: states1,
      states2: states2,
      compute: (it1, it2) => '$it1|$it2',
      equals: (it1, it2) => it1.length == it2.length,
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a', '1a|2aa']);

    tester.stopObserve();
  });

  test('States.computed3 custom equals', () async {
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
      Future(() => setState('3aa'));
      Future(() => setState('3bb'));
      return Disposable.empty;
    });

    final computed = States.computed3<String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      compute: (it1, it2, it3) => '$it1|$it2|$it3',
      equals: (it1, it2) => it1.length == it2.length,
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a', '1a|2a|3aa']);

    tester.stopObserve();
  });

  test('States.computed4 custom equals', () async {
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

    final states4 = States<String>((setState) {
      setState('4a');
      Future(() => setState('4b'));
      Future(() => setState('4aa'));
      Future(() => setState('4bb'));
      return Disposable.empty;
    });

    final computed = States.computed4<String, String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      compute: (it1, it2, it3, it4) => '$it1|$it2|$it3|$it4',
      equals: (it1, it2) => it1.length == it2.length,
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a', '1a|2a|3a|4aa']);

    tester.stopObserve();
  });

  test('States.computed5 custom equals', () async {
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

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      Future(() => setState('5b'));
      Future(() => setState('5aa'));
      Future(() => setState('5bb'));
      return Disposable.empty;
    });

    final computed =
        States.computed5<String, String, String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      compute: (it1, it2, it3, it4, it5) => '$it1|$it2|$it3|$it4|$it5',
      equals: (it1, it2) => it1.length == it2.length,
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a', '1a|2a|3a|4a|5aa']);

    tester.stopObserve();
  });

  test('States.computed6 custom equals', () async {
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

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      Future(() => setState('6b'));
      Future(() => setState('6aa'));
      Future(() => setState('6bb'));
      return Disposable.empty;
    });

    final computed = States.computed6<String, String, String, String, String,
        String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      compute: (it1, it2, it3, it4, it5, it6) =>
          '$it1|$it2|$it3|$it4|$it5|$it6',
      equals: (it1, it2) => it1.length == it2.length,
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a']);

    await Future(() {});

    expect(
        tester.recorded, <String>['1a|2a|3a|4a|5a|6a', '1a|2a|3a|4a|5a|6aa']);

    tester.stopObserve();
  });

  test('States.computed7 custom equals', () async {
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

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      return Disposable.empty;
    });

    final states7 = States<String>((setState) {
      setState('7a');
      Future(() => setState('7b'));
      Future(() => setState('7aa'));
      Future(() => setState('7bb'));
      return Disposable.empty;
    });

    final computed = States.computed7<String, String, String, String, String,
        String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      states7: states7,
      compute: (it1, it2, it3, it4, it5, it6, it7) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7',
      equals: (it1, it2) => it1.length == it2.length,
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a', '1a|2a|3a|4a|5a|6a|7aa']);

    tester.stopObserve();
  });

  test('States.computed8 custom equals', () async {
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

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      return Disposable.empty;
    });

    final states7 = States<String>((setState) {
      setState('7a');
      return Disposable.empty;
    });

    final states8 = States<String>((setState) {
      setState('8a');
      Future(() => setState('8b'));
      Future(() => setState('8aa'));
      Future(() => setState('8bb'));
      return Disposable.empty;
    });

    final computed = States.computed8<String, String, String, String, String,
        String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      states7: states7,
      states8: states8,
      compute: (it1, it2, it3, it4, it5, it6, it7, it8) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8',
      equals: (it1, it2) => it1.length == it2.length,
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a|8a', '1a|2a|3a|4a|5a|6a|7a|8aa']);

    tester.stopObserve();
  });

  test('States.computed9 custom equals', () async {
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

    final states4 = States<String>((setState) {
      setState('4a');
      return Disposable.empty;
    });

    final states5 = States<String>((setState) {
      setState('5a');
      return Disposable.empty;
    });

    final states6 = States<String>((setState) {
      setState('6a');
      return Disposable.empty;
    });

    final states7 = States<String>((setState) {
      setState('7a');
      return Disposable.empty;
    });

    final states8 = States<String>((setState) {
      setState('8a');
      return Disposable.empty;
    });

    final states9 = States<String>((setState) {
      setState('9a');
      Future(() => setState('9b'));
      Future(() => setState('9aa'));
      Future(() => setState('9bb'));
      return Disposable.empty;
    });

    final computed = States.computed9<String, String, String, String, String,
        String, String, String, String, String>(
      states1: states1,
      states2: states2,
      states3: states3,
      states4: states4,
      states5: states5,
      states6: states6,
      states7: states7,
      states8: states8,
      states9: states9,
      compute: (it1, it2, it3, it4, it5, it6, it7, it8, it9) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9',
      equals: (it1, it2) => it1.length == it2.length,
    );

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a', '1a|2a|3a|4a|5a|6a|7a|8a|9aa']);

    tester.stopObserve();
  });
}
