
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';
import '../shared/observable_tester.dart';

void main() {

  test('observable.map', () {

    final observable = Observable<String>((onData) {
      onData('a');
      onData('ab');
      onData('abc');
      return Disposable.empty;
    });

    final map = observable
      .map<int>((data) => data.length);

    final tester = ObservableTester(
      map,
    )..startObserve();
    
    expect(tester.recorded, [
      1,
      2,
      3,
    ]);
    
    tester.stopObserve();

  });

}

