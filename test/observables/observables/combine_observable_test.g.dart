// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combine_observable_test.dart';

// **************************************************************************
// CombineObservableTestGenerator
// **************************************************************************

void _main() {
  test('`Observable.combine` emit if all children emitted', () async {
    final observable1 = Observable<Object?>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<Object?>((onData) {
      Future(() => onData('2a'));
      return Disposable.empty;
    });

    final combine = Observable<String>.combine(
      children: [
        observable1,
        observable2,
      ],
      combiner: (items) => '${items[0]}|${items[1]}',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, []);

    await Future(() {});

    expect(tester.recorded, ['1a|2a']);

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
      child1: observable1,
      child2: observable2,
      combiner: (it1, it2) => '$it1|$it2',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, []);

    await Future(() {});

    expect(tester.recorded, ['1a|2a']);

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
      child1: observable1,
      child2: observable2,
      child3: observable3,
      combiner: (it1, it2, it3) => '$it1|$it2|$it3',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, []);

    await Future(() {});

    expect(tester.recorded, ['1a|2a|3a']);

    tester.stopObserve();
  });

  test('`Observable.combine` emit latest combined value when a child emit',
      () async {
    final observable1 = Observable<Object?>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<Object?>((onData) {
      onData('2a');
      Future(() => onData('2b'));
      return Disposable.empty;
    });

    final combine = Observable<String>.combine(
      children: [
        observable1,
        observable2,
      ],
      combiner: (items) => '${items[0]}|${items[1]}',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, ['1a|2a']);

    await Future(() {});

    expect(tester.recorded, ['1a|2a', '1a|2b']);

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
      child1: observable1,
      child2: observable2,
      combiner: (it1, it2) => '$it1|$it2',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, ['1a|2a']);

    await Future(() {});

    expect(tester.recorded, ['1a|2a', '1a|2b']);

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
      child1: observable1,
      child2: observable2,
      child3: observable3,
      combiner: (it1, it2, it3) => '$it1|$it2|$it3',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    expect(tester.recorded, ['1a|2a|3a']);

    await Future(() {});

    expect(tester.recorded, ['1a|2a|3a', '1a|2a|3b']);

    tester.stopObserve();
  });

  test(
      '`Observable.combine` dispose observation will dispose all children observations',
      () {
    final List<String> invokes = [];

    final observable1 = Observable<Object?>((onData) {
      return Disposable(() {
        invokes.add('dispose1');
      });
    });

    final observable2 = Observable<Object?>((onData) {
      return Disposable(() {
        invokes.add('dispose2');
      });
    });

    final combine = Observable<String>.combine(
      children: [
        observable1,
        observable2,
      ],
      combiner: (items) => '${items[0]}|${items[1]}',
    );

    final observation = combine.observe((data) {});

    expect(invokes, []);

    observation.dispose();

    expect(invokes, ['dispose2', 'dispose1']);
  });

  test(
      '`Observable.combine2` dispose observation will dispose all children observations',
      () {
    final List<String> invokes = [];

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
      child1: observable1,
      child2: observable2,
      combiner: (it1, it2) => '$it1|$it2',
    );

    final observation = combine.observe((data) {});

    expect(invokes, []);

    observation.dispose();

    expect(invokes, ['dispose2', 'dispose1']);
  });

  test(
      '`Observable.combine3` dispose observation will dispose all children observations',
      () {
    final List<String> invokes = [];

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
      child1: observable1,
      child2: observable2,
      child3: observable3,
      combiner: (it1, it2, it3) => '$it1|$it2|$it3',
    );

    final observation = combine.observe((data) {});

    expect(invokes, []);

    observation.dispose();

    expect(invokes, ['dispose3', 'dispose2', 'dispose1']);
  });

  test('`Observable.combine` will not emit data after observation disposed',
      () async {
    final observable1 = Observable<Object?>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<Object?>((onData) {
      onData('2a');
      Future(() => onData('2b'));
      return Disposable.empty;
    });

    final combine = Observable<String>.combine(
      children: [
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

    expect(tester.recorded, ['1a|2a']);

    await Future(() {});

    expect(tester.recorded, ['1a|2a']);
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
      child1: observable1,
      child2: observable2,
      combiner: (it1, it2) => '$it1|$it2',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, ['1a|2a']);

    await Future(() {});

    expect(tester.recorded, ['1a|2a']);
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
      child1: observable1,
      child2: observable2,
      child3: observable3,
      combiner: (it1, it2, it3) => '$it1|$it2|$it3',
    );

    final tester = ObservableTester(
      combine,
    );

    tester.startObserve();

    tester.stopObserve();

    expect(tester.recorded, ['1a|2a|3a']);

    await Future(() {});

    expect(tester.recorded, ['1a|2a|3a']);
  });
}
