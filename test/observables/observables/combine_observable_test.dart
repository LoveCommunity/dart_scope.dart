
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';
import '../../test_gen/combine_observable_test/combine_observable_test.dart';
import '../../toolbox/observable_tester.dart';

part 'combine_observable_test.g.dart';

@combineObservableTest
void main() {
  _main();

  test('combine observable will not emit data after observation disposed', () async {

    final observable1 = Observable<Object?>((onData) {
      onData('1a');
      return Disposable.empty;
    });

    final observable2 = Observable<Object?>((onData) {
      onData('2a');
      Future(() => onData('2b'));
      return Disposable.empty;
    });

    final combineObservable = Observable.combine(
      children: [
        observable1,
        observable2,
      ],
      combiner: (items) => '${items[0]}|${items[1]}',
    );

    final tester = ObservableTester(
      combineObservable,
    )..startObserve();

    tester.stopObserve();

    expect(tester.recorded, [
      '1a|2a',
    ]); 
    await Future(() {});
    expect(tester.recorded, [
      '1a|2a',
    ]);

  });

  test('combine observable2 will not emit data after observation disposed', () async {

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
    )..startObserve();

    tester.stopObserve();

    expect(tester.recorded, [
      '1a|2a',
    ]); 
    await Future(() {});
    expect(tester.recorded, [
      '1a|2a',
    ]);

  });
}
