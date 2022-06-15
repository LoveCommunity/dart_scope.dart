
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';
import '../../toolbox/observable_tester.dart';

void main() {

  test('`observable.where`', () {

    final observable = Observable<String>((onData) {
      onData('a');
      onData('b');
      onData('c');
      return Disposable.empty;
    });

    final where = observable
      .where((it) => it != 'b');

    final tester = ObservableTester(
      where,
    );

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      'a',
      'c',
    ]);

    tester.stopObserve();

  });
}
