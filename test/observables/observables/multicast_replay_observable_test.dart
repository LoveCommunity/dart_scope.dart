
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';
import '../../toolbox/observable_tester.dart';

void main() {

  test('`observable.multicastReplay` connect when observers increase to one', () {

    int invokes = 0;

    final observable = Observable<String>((onData) {
      invokes += 1;
      return Disposable.empty;
    });

    final multicastObservable = observable.multicastReplay(3);

    expect(invokes, 0);
    final observation1 = multicastObservable.observe((data) {});
    expect(invokes, 1);
    final observation2 = multicastObservable.observe((data) {});
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

    final multicastObservable = observable.multicastReplay(3);

    final observation1 = multicastObservable.observe((data) {});
    final observation2 = multicastObservable.observe((data) {});

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

    final multicastObservable = observable.multicastReplay(3);

    final tester1 = ObservableTester(
      multicastObservable,
    );

    final tester2 = ObservableTester(
      multicastObservable,
    );
    
    tester1.startObserve();
    tester2.startObserve();

    expect(tester1.recorded, []);
    expect(tester2.recorded, []);
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

    final multicastObservable = observable.multicastReplay(3);

    final tester = ObservableTester(
      multicastObservable,
    );

    final observation = multicastObservable.observe((data) {});

    expect(tester.recorded, []);
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
