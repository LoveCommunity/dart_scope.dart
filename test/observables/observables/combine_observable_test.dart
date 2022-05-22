
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';
import '../../toolbox/observable_tester.dart';

void main() {

  test('combine observable emit if all children emitted', () async {

    final observableA = Observable<Object?>((onData) {
      onData('a1');
      return Disposable.empty;
    });

    final observableB = Observable<Object?>((onData) {
      Future(() => onData('b1'));
      return Disposable.empty;
    });

    final combineObservable = Observable<String>.combine(
      children: [
        observableA,
        observableB,
      ],
      combiner: (items) => '${items[0]}|${items[1]}',
    );

    final tester = ObservableTester(
      combineObservable
    )..startObserve();
    
    expect(tester.recorded, []);
    await Future(() {});
    expect(tester.recorded, [
      'a1|b1',
    ]);

    tester.stopObserve();

  });

  test('combine observable emit latest combined value when a child emit', () async {

    final observableA = Observable<Object?>((onData) {
      onData('a1');
      return Disposable.empty;
    });

    final observableB = Observable<Object?>((onData) {
      onData('b1');
      Future(() => onData('b2'));
      return Disposable.empty;
    });

    final combineObservable = Observable.combine(
      children: [
        observableA,
        observableB,
      ],
      combiner: (items) => '${items[0]}|${items[1]}',
    );

    final tester = ObservableTester(
      combineObservable,
    )..startObserve();

    expect(tester.recorded, [
      'a1|b1',
    ]);
    await Future(() {});
    expect(tester.recorded, [
      'a1|b1',
      'a1|b2',
    ]);

    tester.stopObserve();

  });

  test('combine observable dispose observation will dispose all children observabtions', () {

    final List<String> invokes = [];

    final observableA = Observable<Object?>((onData) {
      return Disposable(() {
        invokes.add('disposeA');
      });
    });

    final observableB = Observable<Object?>((onData) {
      return Disposable(() {
        invokes.add('disposeB');
      });
    });

    final combineObservable = Observable.combine(
      children: [
        observableA,
        observableB,
      ],
      combiner: (items) => '',
    );

    final observation = combineObservable.observe((data) {});

    expect(invokes, []);
    observation.dispose();
    expect(invokes, [
      'disposeB',
      'disposeA',
    ]);

  });

  test('combine observable will not emit data after observation disposed', () async {

    final observableA = Observable<Object?>((onData) {
      onData('a1');
      return Disposable.empty;
    });

    final observableB = Observable<Object?>((onData) {
      onData('b1');
      Future(() => onData('b2'));
      return Disposable.empty;
    });

    final combineObservable = Observable.combine(
      children: [
        observableA,
        observableB,
      ],
      combiner: (items) => '${items[0]}|${items[1]}',
    );

    final tester = ObservableTester(
      combineObservable,
    )..startObserve();

    tester.stopObserve();

    expect(tester.recorded, [
      'a1|b1',
    ]); 
    await Future(() {});
    expect(tester.recorded, [
      'a1|b1',
    ]);

  });
}
