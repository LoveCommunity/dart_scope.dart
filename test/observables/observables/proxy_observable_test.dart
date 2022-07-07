import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../shared/observable_tester.dart';

void main() {
  
  test('`ProxyObservable` observe', () {

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

  test('`ProxyObservable` observation dispose', () {

    int invokes = 0;

    final observable = Observable<String>((onData) {
      return Disposable(() {
        invokes += 1;
      });
    });

    final proxyObservable = ProxyObservable(
      proxy: observable,
    );
    
    final observation = proxyObservable.observe((_) {});

    expect(invokes, 0);
    observation.dispose();
    expect(invokes, 1);

  });
}
