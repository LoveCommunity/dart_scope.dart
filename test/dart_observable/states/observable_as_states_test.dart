

import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../shared/states_tester.dart';

void main() {

  test('observable.asStates connect when observers increase to one', () {

    int invokes = 0;

    final observable = Observable<String>((onData) {
      onData('a');
      invokes += 1;
      return Disposable.empty;
    });

    final states = observable.asStates();

    expect(invokes, 0);
    final observation1 = states.observe((_) {});
    expect(invokes, 1);
    final observation2 = states.observe((_) {});
    expect(invokes, 1);

    observation1.dispose();
    observation2.dispose();

  });

  test('observable.asStates disconnect when observers decrease to zero', () {

    int invokes = 0;

    final observable = Observable<String>((onData) {
      onData('a');
      return Disposable(() {
        invokes += 1;
      });
    });

    final states = observable.asStates();

    final observation1 = states.observe((_) {});
    final observation2 = states.observe((_) {});

    expect(invokes, 0);
    observation1.dispose();
    expect(invokes, 0);
    observation2.dispose();
    expect(invokes, 1);

  });

  test('observable.asStates forward data to observers', () async {

    final observable = Observable<String>((onData) {
      onData('a');
      Future(() => onData('b'));
      return Disposable.empty;
    });

    final states = observable.asStates();

    final tester1 = StatesTester(
      states,
    );

    final tester2 = StatesTester(
      states,
    );


    tester1.startObserve();
    tester2.startObserve();

    expect(tester1.recorded, [
      'a',
    ]);
    expect(tester2.recorded, [
      'a',
    ]);
    await Future(() {});
    expect(tester1.recorded, [
      'a',
      'b',
    ]);
    expect(tester2.recorded, [
      'a',
      'b',
    ]);

    tester1.stopObserve();
    tester2.stopObserve();

  });

  test('observable.asStates replay data to observers', () {

    final observable = Observable<String>((onData) {
      onData('a');
      onData('b');
      onData('c');
      return Disposable.empty;
    });

    final states = observable.asStates();

    final tester = StatesTester(
      states,
    );

    final observation  = states.observe((_) {});

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, [
      'c',
    ]);

    tester.stopObserve();
    observation.dispose();

  });

}

