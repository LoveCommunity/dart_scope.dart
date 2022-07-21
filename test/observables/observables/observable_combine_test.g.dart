// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observable_combine_test.dart';

// **************************************************************************
// ObservableCombineTestGenerator
// **************************************************************************

void _main() {
  test('`Observable.combine` emit if all children emitted', () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      Future(() => onData('2a'));
      return Disposable.empty;
    });

    final combine = Observable.combine<String, String>(
      observables: [
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

  test('`Observable.combine2` emit if all children emitted', () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      Future(() => onData('2a'));
      return Disposable.empty;
    });

    final combine = Observable.combine2<String, String, String>(
      observable1: observable1,
      observable2: observable2,
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

  test('`Observable.combine3` emit if all children emitted', () async {
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
      observable1: observable1,
      observable2: observable2,
      observable3: observable3,
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

  test('`Observable.combine` emit latest combined value when a child emit',
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
      observables: [
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

  test('`Observable.combine2` emit latest combined value when a child emit',
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
      observable1: observable1,
      observable2: observable2,
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

  test('`Observable.combine3` emit latest combined value when a child emit',
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
      observable1: observable1,
      observable2: observable2,
      observable3: observable3,
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

  test(
      '`Observable.combine` dispose observation will dispose all children observations',
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
      observables: [
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
      '`Observable.combine2` dispose observation will dispose all children observations',
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
      observable1: observable1,
      observable2: observable2,
      combiner: (it1, it2) => '$it1|$it2',
    );

    final observation = combine.observe((_) {});

    expect(invokes, <String>[]);

    observation.dispose();

    expect(invokes, <String>['dispose2', 'dispose1']);
  });

  test(
      '`Observable.combine3` dispose observation will dispose all children observations',
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
      observable1: observable1,
      observable2: observable2,
      observable3: observable3,
      combiner: (it1, it2, it3) => '$it1|$it2|$it3',
    );

    final observation = combine.observe((_) {});

    expect(invokes, <String>[]);

    observation.dispose();

    expect(invokes, <String>['dispose3', 'dispose2', 'dispose1']);
  });

  test('`Observable.combine` will not emit data after observation disposed',
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
      observables: [
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

  test('`Observable.combine2` will not emit data after observation disposed',
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
      observable1: observable1,
      observable2: observable2,
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

  test('`Observable.combine3` will not emit data after observation disposed',
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
      observable1: observable1,
      observable2: observable2,
      observable3: observable3,
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
}
