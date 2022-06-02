import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../toolbox/observable_tester.dart';

void main() {
  
  test('proxy observable observe', () {

    final observable = Observable<String>((onData) {
      onData('a');
      return Disposable.empty;
    });

    final proxyObservable = ProxyObservable(
      proxy: observable,
    );

    final tester = ObservableTester(
      proxyObservable,
    );

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, ['a']);

    tester.stopObserve();

  });

  test('proxy observable observation dispose', () {

    int invokes = 0;

    final observable = Observable<String>((onData) {
      return Disposable(() {
        invokes += 1;
      });
    });

    final proxyObservable = ProxyObservable(
      proxy: observable,
    );
    
    final observation = proxyObservable.observe((data) {});

    expect(invokes, 0);
    observation.dispose();
    expect(invokes, 1);

  });
}
