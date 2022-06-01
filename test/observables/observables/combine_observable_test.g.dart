// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combine_observable_test.dart';

// **************************************************************************
// CombineObservableTestGenerator
// **************************************************************************

void _main() {
  test('combine observable emit if all children emitted', () async {
    final observable1 = Observable<Object?>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<Object?>((onData) {
      Future(() => onData('2a'));
      return Disposable.empty;
    });

    final combineObservable = Observable<String>.combine(
      children: [
        observable1,
        observable2,
      ],
      combiner: (items) => '${items[0]}|${items[1]}',
    );

    final tester = ObservableTester(
      combineObservable,
    );

    tester.startObserve();

    expect(tester.recorded, []);

    await Future(() {});

    expect(tester.recorded, ['1a|2a']);

    tester.stopObserve();
  });

  test('combine observable2 emit if all children emitted', () async {
    final observable1 = Observable<String>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<String>((onData) {
      Future(() => onData('2a'));
      return Disposable.empty;
    });

    final combineObservable = Observable.combine2<String, String, String>(
      child1: observable1,
      child2: observable2,
      combiner: (it1, it2) => '$it1|$it2',
    );

    final tester = ObservableTester(
      combineObservable,
    );

    tester.startObserve();

    expect(tester.recorded, []);

    await Future(() {});

    expect(tester.recorded, ['1a|2a']);

    tester.stopObserve();
  });

  test('combine observable emit latest combined value when a child emit',
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

    final combineObservable = Observable<String>.combine(
      children: [
        observable1,
        observable2,
      ],
      combiner: (items) => '${items[0]}|${items[1]}',
    );

    final tester = ObservableTester(
      combineObservable,
    );

    tester.startObserve();

    expect(tester.recorded, ['1a|2a']);

    await Future(() {});

    expect(tester.recorded, ['1a|2a', '1a|2b']);

    tester.stopObserve();
  });

  test('combine observable2 emit latest combined value when a child emit',
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

    final combineObservable = Observable.combine2<String, String, String>(
      child1: observable1,
      child2: observable2,
      combiner: (it1, it2) => '$it1|$it2',
    );

    final tester = ObservableTester(
      combineObservable,
    );

    tester.startObserve();

    expect(tester.recorded, ['1a|2a']);

    await Future(() {});

    expect(tester.recorded, ['1a|2a', '1a|2b']);

    tester.stopObserve();
  });

  test(
      'combine observable dispose observation will dispose all children observations',
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

    final combineObservable = Observable<String>.combine(
      children: [
        observable1,
        observable2,
      ],
      combiner: (items) => '${items[0]}|${items[1]}',
    );

    final observation = combineObservable.observe((data) {});

    expect(invokes, []);

    observation.dispose();

    expect(invokes, ['dispose2', 'dispose1']);
  });

  test(
      'combine observable2 dispose observation will dispose all children observations',
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

    final combineObservable = Observable.combine2<String, String, String>(
      child1: observable1,
      child2: observable2,
      combiner: (it1, it2) => '$it1|$it2',
    );

    final observation = combineObservable.observe((data) {});

    expect(invokes, []);

    observation.dispose();

    expect(invokes, ['dispose2', 'dispose1']);
  });
}
