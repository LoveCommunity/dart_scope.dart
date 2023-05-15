// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observable_combine_test.dart';

// **************************************************************************
// ObservableCombineTestGenerator
// **************************************************************************

void _main() {
  test('Observable.combine emit if all sources emitted', () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      Future(() => onData('2a'));
      return Disposable.empty;
    });

    final combine = Observable.combine<String, String>(
      sources: [
        observable1,
        observable2,
      ],
      combiner: (items) => '${items[0]}|${items[1]}',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, <String>[]);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a']);

    tester.stopObserve();
  });

  test('Observable.combine2 emit if all sources emitted', () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      Future(() => onData('2a'));
      return Disposable.empty;
    });

    final combine = Observable.combine2<String, String, String>(
      source1: observable1,
      source2: observable2,
      combiner: (it1, it2) => '$it1|$it2',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, <String>[]);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a']);

    tester.stopObserve();
  });

  test('Observable.combine3 emit if all sources emitted', () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      Future(() => onData('3a'));
      return Disposable.empty;
    });

    final combine = Observable.combine3<String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      combiner: (it1, it2, it3) => '$it1|$it2|$it3',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, <String>[]);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a']);

    tester.stopObserve();
  });

  test('Observable.combine4 emit if all sources emitted', () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final observable4 = Observable<String>((onData) {
      Future(() => onData('4a'));
      return Disposable.empty;
    });

    final combine = Observable.combine4<String, String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      combiner: (it1, it2, it3, it4) => '$it1|$it2|$it3|$it4',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, <String>[]);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a']);

    tester.stopObserve();
  });

  test('Observable.combine5 emit if all sources emitted', () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final observable4 = Observable<String>((onData) {
      onData('4a');
      return Disposable.empty;
    });

    final observable5 = Observable<String>((onData) {
      Future(() => onData('5a'));
      return Disposable.empty;
    });

    final combine =
        Observable.combine5<String, String, String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      combiner: (it1, it2, it3, it4, it5) => '$it1|$it2|$it3|$it4|$it5',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, <String>[]);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a']);

    tester.stopObserve();
  });

  test('Observable.combine6 emit if all sources emitted', () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final observable4 = Observable<String>((onData) {
      onData('4a');
      return Disposable.empty;
    });

    final observable5 = Observable<String>((onData) {
      onData('5a');
      return Disposable.empty;
    });

    final observable6 = Observable<String>((onData) {
      Future(() => onData('6a'));
      return Disposable.empty;
    });

    final combine = Observable.combine6<String, String, String, String, String,
        String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      source6: observable6,
      combiner: (it1, it2, it3, it4, it5, it6) =>
          '$it1|$it2|$it3|$it4|$it5|$it6',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, <String>[]);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a']);

    tester.stopObserve();
  });

  test('Observable.combine7 emit if all sources emitted', () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final observable4 = Observable<String>((onData) {
      onData('4a');
      return Disposable.empty;
    });

    final observable5 = Observable<String>((onData) {
      onData('5a');
      return Disposable.empty;
    });

    final observable6 = Observable<String>((onData) {
      onData('6a');
      return Disposable.empty;
    });

    final observable7 = Observable<String>((onData) {
      Future(() => onData('7a'));
      return Disposable.empty;
    });

    final combine = Observable.combine7<String, String, String, String, String,
        String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      source6: observable6,
      source7: observable7,
      combiner: (it1, it2, it3, it4, it5, it6, it7) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, <String>[]);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a']);

    tester.stopObserve();
  });

  test('Observable.combine8 emit if all sources emitted', () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final observable4 = Observable<String>((onData) {
      onData('4a');
      return Disposable.empty;
    });

    final observable5 = Observable<String>((onData) {
      onData('5a');
      return Disposable.empty;
    });

    final observable6 = Observable<String>((onData) {
      onData('6a');
      return Disposable.empty;
    });

    final observable7 = Observable<String>((onData) {
      onData('7a');
      return Disposable.empty;
    });

    final observable8 = Observable<String>((onData) {
      Future(() => onData('8a'));
      return Disposable.empty;
    });

    final combine = Observable.combine8<String, String, String, String, String,
        String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      source6: observable6,
      source7: observable7,
      source8: observable8,
      combiner: (it1, it2, it3, it4, it5, it6, it7, it8) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, <String>[]);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a']);

    tester.stopObserve();
  });

  test('Observable.combine9 emit if all sources emitted', () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final observable4 = Observable<String>((onData) {
      onData('4a');
      return Disposable.empty;
    });

    final observable5 = Observable<String>((onData) {
      onData('5a');
      return Disposable.empty;
    });

    final observable6 = Observable<String>((onData) {
      onData('6a');
      return Disposable.empty;
    });

    final observable7 = Observable<String>((onData) {
      onData('7a');
      return Disposable.empty;
    });

    final observable8 = Observable<String>((onData) {
      onData('8a');
      return Disposable.empty;
    });

    final observable9 = Observable<String>((onData) {
      Future(() => onData('9a'));
      return Disposable.empty;
    });

    final combine = Observable.combine9<String, String, String, String, String,
        String, String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      source6: observable6,
      source7: observable7,
      source8: observable8,
      source9: observable9,
      combiner: (it1, it2, it3, it4, it5, it6, it7, it8, it9) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, <String>[]);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a']);

    tester.stopObserve();
  });

  test('Observable.combine emit latest combined value when a source emit',
      () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      Future(() => onData('2b'));
      return Disposable.empty;
    });

    final combine = Observable.combine<String, String>(
      sources: [
        observable1,
        observable2,
      ],
      combiner: (items) => '${items[0]}|${items[1]}',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a', '1a|2b']);

    tester.stopObserve();
  });

  test('Observable.combine2 emit latest combined value when a source emit',
      () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      Future(() => onData('2b'));
      return Disposable.empty;
    });

    final combine = Observable.combine2<String, String, String>(
      source1: observable1,
      source2: observable2,
      combiner: (it1, it2) => '$it1|$it2',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a', '1a|2b']);

    tester.stopObserve();
  });

  test('Observable.combine3 emit latest combined value when a source emit',
      () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      Future(() => onData('3b'));
      return Disposable.empty;
    });

    final combine = Observable.combine3<String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      combiner: (it1, it2, it3) => '$it1|$it2|$it3',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a', '1a|2a|3b']);

    tester.stopObserve();
  });

  test('Observable.combine4 emit latest combined value when a source emit',
      () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final observable4 = Observable<String>((onData) {
      onData('4a');
      Future(() => onData('4b'));
      return Disposable.empty;
    });

    final combine = Observable.combine4<String, String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      combiner: (it1, it2, it3, it4) => '$it1|$it2|$it3|$it4',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a', '1a|2a|3a|4b']);

    tester.stopObserve();
  });

  test('Observable.combine5 emit latest combined value when a source emit',
      () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final observable4 = Observable<String>((onData) {
      onData('4a');
      return Disposable.empty;
    });

    final observable5 = Observable<String>((onData) {
      onData('5a');
      Future(() => onData('5b'));
      return Disposable.empty;
    });

    final combine =
        Observable.combine5<String, String, String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      combiner: (it1, it2, it3, it4, it5) => '$it1|$it2|$it3|$it4|$it5',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a', '1a|2a|3a|4a|5b']);

    tester.stopObserve();
  });

  test('Observable.combine6 emit latest combined value when a source emit',
      () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final observable4 = Observable<String>((onData) {
      onData('4a');
      return Disposable.empty;
    });

    final observable5 = Observable<String>((onData) {
      onData('5a');
      return Disposable.empty;
    });

    final observable6 = Observable<String>((onData) {
      onData('6a');
      Future(() => onData('6b'));
      return Disposable.empty;
    });

    final combine = Observable.combine6<String, String, String, String, String,
        String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      source6: observable6,
      combiner: (it1, it2, it3, it4, it5, it6) =>
          '$it1|$it2|$it3|$it4|$it5|$it6',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a', '1a|2a|3a|4a|5a|6b']);

    tester.stopObserve();
  });

  test('Observable.combine7 emit latest combined value when a source emit',
      () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final observable4 = Observable<String>((onData) {
      onData('4a');
      return Disposable.empty;
    });

    final observable5 = Observable<String>((onData) {
      onData('5a');
      return Disposable.empty;
    });

    final observable6 = Observable<String>((onData) {
      onData('6a');
      return Disposable.empty;
    });

    final observable7 = Observable<String>((onData) {
      onData('7a');
      Future(() => onData('7b'));
      return Disposable.empty;
    });

    final combine = Observable.combine7<String, String, String, String, String,
        String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      source6: observable6,
      source7: observable7,
      combiner: (it1, it2, it3, it4, it5, it6, it7) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a', '1a|2a|3a|4a|5a|6a|7b']);

    tester.stopObserve();
  });

  test('Observable.combine8 emit latest combined value when a source emit',
      () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final observable4 = Observable<String>((onData) {
      onData('4a');
      return Disposable.empty;
    });

    final observable5 = Observable<String>((onData) {
      onData('5a');
      return Disposable.empty;
    });

    final observable6 = Observable<String>((onData) {
      onData('6a');
      return Disposable.empty;
    });

    final observable7 = Observable<String>((onData) {
      onData('7a');
      return Disposable.empty;
    });

    final observable8 = Observable<String>((onData) {
      onData('8a');
      Future(() => onData('8b'));
      return Disposable.empty;
    });

    final combine = Observable.combine8<String, String, String, String, String,
        String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      source6: observable6,
      source7: observable7,
      source8: observable8,
      combiner: (it1, it2, it3, it4, it5, it6, it7, it8) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a|8a', '1a|2a|3a|4a|5a|6a|7a|8b']);

    tester.stopObserve();
  });

  test('Observable.combine9 emit latest combined value when a source emit',
      () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final observable4 = Observable<String>((onData) {
      onData('4a');
      return Disposable.empty;
    });

    final observable5 = Observable<String>((onData) {
      onData('5a');
      return Disposable.empty;
    });

    final observable6 = Observable<String>((onData) {
      onData('6a');
      return Disposable.empty;
    });

    final observable7 = Observable<String>((onData) {
      onData('7a');
      return Disposable.empty;
    });

    final observable8 = Observable<String>((onData) {
      onData('8a');
      return Disposable.empty;
    });

    final observable9 = Observable<String>((onData) {
      onData('9a');
      Future(() => onData('9b'));
      return Disposable.empty;
    });

    final combine = Observable.combine9<String, String, String, String, String,
        String, String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      source6: observable6,
      source7: observable7,
      source8: observable8,
      source9: observable9,
      combiner: (it1, it2, it3, it4, it5, it6, it7, it8, it9) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a', '1a|2a|3a|4a|5a|6a|7a|8a|9b']);

    tester.stopObserve();
  });

  test(
      'Observable.combine dispose observation will dispose all source observations',
      () {
    final invokes = <String>[];
    final observable1 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose1');
      });
    });

    final observable2 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose2');
      });
    });

    final combine = Observable.combine<String, String>(
      sources: [
        observable1,
        observable2,
      ],
      combiner: (items) => '${items[0]}|${items[1]}',
    );

    final observation = combine.observe((_) {});

    expect(invokes, <String>[]);

    observation.dispose();

    expect(invokes, <String>['dispose2', 'dispose1']);
  });

  test(
      'Observable.combine2 dispose observation will dispose all source observations',
      () {
    final invokes = <String>[];
    final observable1 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose1');
      });
    });

    final observable2 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose2');
      });
    });

    final combine = Observable.combine2<String, String, String>(
      source1: observable1,
      source2: observable2,
      combiner: (it1, it2) => '$it1|$it2',
    );

    final observation = combine.observe((_) {});

    expect(invokes, <String>[]);

    observation.dispose();

    expect(invokes, <String>['dispose2', 'dispose1']);
  });

  test(
      'Observable.combine3 dispose observation will dispose all source observations',
      () {
    final invokes = <String>[];
    final observable1 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose1');
      });
    });

    final observable2 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose2');
      });
    });

    final observable3 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose3');
      });
    });

    final combine = Observable.combine3<String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      combiner: (it1, it2, it3) => '$it1|$it2|$it3',
    );

    final observation = combine.observe((_) {});

    expect(invokes, <String>[]);

    observation.dispose();

    expect(invokes, <String>['dispose3', 'dispose2', 'dispose1']);
  });

  test(
      'Observable.combine4 dispose observation will dispose all source observations',
      () {
    final invokes = <String>[];
    final observable1 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose1');
      });
    });

    final observable2 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose2');
      });
    });

    final observable3 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose3');
      });
    });

    final observable4 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose4');
      });
    });

    final combine = Observable.combine4<String, String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      combiner: (it1, it2, it3, it4) => '$it1|$it2|$it3|$it4',
    );

    final observation = combine.observe((_) {});

    expect(invokes, <String>[]);

    observation.dispose();

    expect(invokes, <String>['dispose4', 'dispose3', 'dispose2', 'dispose1']);
  });

  test(
      'Observable.combine5 dispose observation will dispose all source observations',
      () {
    final invokes = <String>[];
    final observable1 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose1');
      });
    });

    final observable2 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose2');
      });
    });

    final observable3 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose3');
      });
    });

    final observable4 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose4');
      });
    });

    final observable5 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose5');
      });
    });

    final combine =
        Observable.combine5<String, String, String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      combiner: (it1, it2, it3, it4, it5) => '$it1|$it2|$it3|$it4|$it5',
    );

    final observation = combine.observe((_) {});

    expect(invokes, <String>[]);

    observation.dispose();

    expect(invokes,
        <String>['dispose5', 'dispose4', 'dispose3', 'dispose2', 'dispose1']);
  });

  test(
      'Observable.combine6 dispose observation will dispose all source observations',
      () {
    final invokes = <String>[];
    final observable1 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose1');
      });
    });

    final observable2 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose2');
      });
    });

    final observable3 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose3');
      });
    });

    final observable4 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose4');
      });
    });

    final observable5 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose5');
      });
    });

    final observable6 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose6');
      });
    });

    final combine = Observable.combine6<String, String, String, String, String,
        String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      source6: observable6,
      combiner: (it1, it2, it3, it4, it5, it6) =>
          '$it1|$it2|$it3|$it4|$it5|$it6',
    );

    final observation = combine.observe((_) {});

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
      'Observable.combine7 dispose observation will dispose all source observations',
      () {
    final invokes = <String>[];
    final observable1 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose1');
      });
    });

    final observable2 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose2');
      });
    });

    final observable3 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose3');
      });
    });

    final observable4 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose4');
      });
    });

    final observable5 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose5');
      });
    });

    final observable6 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose6');
      });
    });

    final observable7 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose7');
      });
    });

    final combine = Observable.combine7<String, String, String, String, String,
        String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      source6: observable6,
      source7: observable7,
      combiner: (it1, it2, it3, it4, it5, it6, it7) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7',
    );

    final observation = combine.observe((_) {});

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
      'Observable.combine8 dispose observation will dispose all source observations',
      () {
    final invokes = <String>[];
    final observable1 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose1');
      });
    });

    final observable2 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose2');
      });
    });

    final observable3 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose3');
      });
    });

    final observable4 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose4');
      });
    });

    final observable5 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose5');
      });
    });

    final observable6 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose6');
      });
    });

    final observable7 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose7');
      });
    });

    final observable8 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose8');
      });
    });

    final combine = Observable.combine8<String, String, String, String, String,
        String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      source6: observable6,
      source7: observable7,
      source8: observable8,
      combiner: (it1, it2, it3, it4, it5, it6, it7, it8) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8',
    );

    final observation = combine.observe((_) {});

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
      'Observable.combine9 dispose observation will dispose all source observations',
      () {
    final invokes = <String>[];
    final observable1 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose1');
      });
    });

    final observable2 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose2');
      });
    });

    final observable3 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose3');
      });
    });

    final observable4 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose4');
      });
    });

    final observable5 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose5');
      });
    });

    final observable6 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose6');
      });
    });

    final observable7 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose7');
      });
    });

    final observable8 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose8');
      });
    });

    final observable9 = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose9');
      });
    });

    final combine = Observable.combine9<String, String, String, String, String,
        String, String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      source6: observable6,
      source7: observable7,
      source8: observable8,
      source9: observable9,
      combiner: (it1, it2, it3, it4, it5, it6, it7, it8, it9) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9',
    );

    final observation = combine.observe((_) {});

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

  test('Observable.combine will not emit data after observation disposed',
      () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      Future(() => onData('2b'));
      return Disposable.empty;
    });

    final combine = Observable.combine<String, String>(
      sources: [
        observable1,
        observable2,
      ],
      combiner: (items) => '${items[0]}|${items[1]}',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, <String>['1a|2a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a']);
  });

  test('Observable.combine2 will not emit data after observation disposed',
      () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      Future(() => onData('2b'));
      return Disposable.empty;
    });

    final combine = Observable.combine2<String, String, String>(
      source1: observable1,
      source2: observable2,
      combiner: (it1, it2) => '$it1|$it2',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, <String>['1a|2a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a']);
  });

  test('Observable.combine3 will not emit data after observation disposed',
      () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      Future(() => onData('3b'));
      return Disposable.empty;
    });

    final combine = Observable.combine3<String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      combiner: (it1, it2, it3) => '$it1|$it2|$it3',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, <String>['1a|2a|3a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a']);
  });

  test('Observable.combine4 will not emit data after observation disposed',
      () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final observable4 = Observable<String>((onData) {
      onData('4a');
      Future(() => onData('4b'));
      return Disposable.empty;
    });

    final combine = Observable.combine4<String, String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      combiner: (it1, it2, it3, it4) => '$it1|$it2|$it3|$it4',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a']);
  });

  test('Observable.combine5 will not emit data after observation disposed',
      () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final observable4 = Observable<String>((onData) {
      onData('4a');
      return Disposable.empty;
    });

    final observable5 = Observable<String>((onData) {
      onData('5a');
      Future(() => onData('5b'));
      return Disposable.empty;
    });

    final combine =
        Observable.combine5<String, String, String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      combiner: (it1, it2, it3, it4, it5) => '$it1|$it2|$it3|$it4|$it5',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a']);
  });

  test('Observable.combine6 will not emit data after observation disposed',
      () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final observable4 = Observable<String>((onData) {
      onData('4a');
      return Disposable.empty;
    });

    final observable5 = Observable<String>((onData) {
      onData('5a');
      return Disposable.empty;
    });

    final observable6 = Observable<String>((onData) {
      onData('6a');
      Future(() => onData('6b'));
      return Disposable.empty;
    });

    final combine = Observable.combine6<String, String, String, String, String,
        String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      source6: observable6,
      combiner: (it1, it2, it3, it4, it5, it6) =>
          '$it1|$it2|$it3|$it4|$it5|$it6',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a']);
  });

  test('Observable.combine7 will not emit data after observation disposed',
      () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final observable4 = Observable<String>((onData) {
      onData('4a');
      return Disposable.empty;
    });

    final observable5 = Observable<String>((onData) {
      onData('5a');
      return Disposable.empty;
    });

    final observable6 = Observable<String>((onData) {
      onData('6a');
      return Disposable.empty;
    });

    final observable7 = Observable<String>((onData) {
      onData('7a');
      Future(() => onData('7b'));
      return Disposable.empty;
    });

    final combine = Observable.combine7<String, String, String, String, String,
        String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      source6: observable6,
      source7: observable7,
      combiner: (it1, it2, it3, it4, it5, it6, it7) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a']);
  });

  test('Observable.combine8 will not emit data after observation disposed',
      () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final observable4 = Observable<String>((onData) {
      onData('4a');
      return Disposable.empty;
    });

    final observable5 = Observable<String>((onData) {
      onData('5a');
      return Disposable.empty;
    });

    final observable6 = Observable<String>((onData) {
      onData('6a');
      return Disposable.empty;
    });

    final observable7 = Observable<String>((onData) {
      onData('7a');
      return Disposable.empty;
    });

    final observable8 = Observable<String>((onData) {
      onData('8a');
      Future(() => onData('8b'));
      return Disposable.empty;
    });

    final combine = Observable.combine8<String, String, String, String, String,
        String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      source6: observable6,
      source7: observable7,
      source8: observable8,
      combiner: (it1, it2, it3, it4, it5, it6, it7, it8) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a']);
  });

  test('Observable.combine9 will not emit data after observation disposed',
      () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      onData('2a');
      return Disposable.empty;
    });

    final observable3 = Observable<String>((onData) {
      onData('3a');
      return Disposable.empty;
    });

    final observable4 = Observable<String>((onData) {
      onData('4a');
      return Disposable.empty;
    });

    final observable5 = Observable<String>((onData) {
      onData('5a');
      return Disposable.empty;
    });

    final observable6 = Observable<String>((onData) {
      onData('6a');
      return Disposable.empty;
    });

    final observable7 = Observable<String>((onData) {
      onData('7a');
      return Disposable.empty;
    });

    final observable8 = Observable<String>((onData) {
      onData('8a');
      return Disposable.empty;
    });

    final observable9 = Observable<String>((onData) {
      onData('9a');
      Future(() => onData('9b'));
      return Disposable.empty;
    });

    final combine = Observable.combine9<String, String, String, String, String,
        String, String, String, String, String>(
      source1: observable1,
      source2: observable2,
      source3: observable3,
      source4: observable4,
      source5: observable5,
      source6: observable6,
      source7: observable7,
      source8: observable8,
      source9: observable9,
      combiner: (it1, it2, it3, it4, it5, it6, it7, it8, it9) =>
          '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a']);
  });
}
