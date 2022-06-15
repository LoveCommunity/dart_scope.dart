
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';
import '../../toolbox/observable_tester.dart';

void main()  {

  test('`observable.skip`', () {
    
    final observable = Observable<String>((onData) {
      onData('a');
      onData('b');
      onData('c');
      onData('d');
      onData('e');
      onData('f');
      return Disposable.empty;
    });

    final skip = observable.skip(3);

    final tester = ObservableTester(
      skip,
    );

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      'd',
      'e',
      'f',
    ]);

    tester.stopObserve();

  });

}
