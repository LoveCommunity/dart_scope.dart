
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';
import '../shared/observable_tester.dart';

void main() {

  test('`observable.multicastReplay` connect when observers increase to one', () {

    int invokes = 0;

    final observable = Observable<String>((onData) {
      invokes += 1;
      return Disposable.empty;
    });

    final multicastReplay = observable.multicastReplay(3);

    expect(invokes, 0);
    final observation1 = multicastReplay.observe((_) {});
    expect(invokes, 1);
    final observation2 = multicastReplay.observe((_) {});
    expect(invokes, 1);

    observation1.dispose();
    observation2.dispose();

  });

  test('`observable.multicastReplay` disconnect when observers decrease to zero', () {

    int invokes = 0;

    final observable = Observable<String>((onData) {
      return Disposable(() {
        invokes += 1;
      });
    });

    final multicastReplay = observable.multicastReplay(3);

    final observation1 = multicastReplay.observe((_) {});
    final observation2 = multicastReplay.observe((_) {});

    expect(invokes, 0);
    observation1.dispose();
    expect(invokes, 0);
    observation2.dispose();
    expect(invokes, 1);

  });

  test('`observable.multicastReplay` forward data to observers', () async {
  
    final observable = Observable<String>((onData) {
      Future(() => onData('a'));
      return Disposable.empty;
    });

    final multicastReplay = observable.multicastReplay(3);

    final tester1 = ObservableTester(
      multicastReplay,
    );

    final tester2 = ObservableTester(
      multicastReplay,
    );
    
    tester1.startObserve();
    tester2.startObserve();

    expect(tester1.recorded, <String>[]);
    expect(tester2.recorded, <String>[]);
    await Future(() {});
    expect(tester1.recorded, [
      'a',
    ]);
    expect(tester2.recorded, [
      'a',
    ]);

    tester1.stopObserve();
    tester2.stopObserve();

  });

  test('`observable.multicastReplay` replay data to observers', () {

    final observable = Observable<String>((onData) {
      onData('a');
      onData('b');
      onData('c');
      onData('d');
      onData('e');
      onData('f');
      return Disposable.empty;
    });

    final multicastReplay = observable.multicastReplay(3);

    final tester = ObservableTester(
      multicastReplay,
    );

    final observation = multicastReplay.observe((_) {});

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, [
      'd',
      'e',
      'f',
    ]);

    tester.stopObserve();
    observation.dispose();


  });

}
