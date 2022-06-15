
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../toolbox/observable_tester.dart';

void main() {

  test('`observable.cast` success', () {

    final observable = Observable<String>((onData) {
      onData('a');
      return Disposable.empty;
    }); 

    final castObservable = observable.cast<Object>();

    final tester = ObservableTester(
      castObservable,
    );

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      'a',
    ]);

    tester.stopObserve();
  });

  test('`observable.cast` failure', () {

    final observable = Observable<String>((onData) {
      onData('a');
      return Disposable.empty;
    });

    final castObservable = observable.cast<int>();

    expect(
      () {
        castObservable.observe((data) {});
      },
      throwsA(
        isA<TypeError>()
      ),
    );
  });
}
