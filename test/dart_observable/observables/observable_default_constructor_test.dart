
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../../shared/async_toolbox.dart';
import '../shared/observable_tester.dart';

void main() {

  test('Observable.defaultConstructor sync', () {
    
    final observable = Observable<String>((onData) {
      onData('a');
      return Disposable.empty;
    });

    final tester = ObservableTester(
      observable,
    );

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, [
      'a',
    ]);

    tester.stopObserve();

  });

  test('Observable.defaultConstructor async', () async {

    final observable = Observable<String>((onData) {
      Future<void>(() => onData('a'));
      return Disposable.empty;
    });

    final tester = ObservableTester(
      observable,
    );

    expect(tester.recorded, <String>[]);
    tester.startObserve();
    expect(tester.recorded, <String>[]);

    await delayed(30);
    expect(tester.recorded, [
      'a',
    ]);

    tester.stopObserve();

  });

  test('Observable.defaultConstructor observation dispose', () {

    int invoked = 0;

    final observable = Observable<String>((onData) {
      return Disposable(() {
        invoked += 1;
      });
    });

    final observation = observable.observe((_) {});

    expect(invoked, 0);
    observation.dispose();
    expect(invoked, 1);
  });

  test('Observable.defaultConstructor not receive data after disposed', () async {

    final observable = Observable<String>((onData) {
      onData('a');
      Future<void>(() => onData('b'));
      return Disposable.empty;
    });
    
    final tester = ObservableTester(
      observable,
    )..startObserve();

    expect(tester.recorded, [
      'a',
    ]);
    
    tester.stopObserve();

    await delayed(30);
    expect(tester.recorded, [
      'a',
    ]);
    
  });


}
