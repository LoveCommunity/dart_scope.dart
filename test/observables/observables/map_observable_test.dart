
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

void main() {

  test('map observable', () {

    final List<int> invokes = [];

    final observable = Observable<String>((onData) {
      onData('a');
      onData('ab');
      onData('abc');
      return Disposable.empty;
    });

    final mapObservable = observable
      .map<int>((data) => data.length);

    final OnData<int> onData = (data) {
      invokes.add(data);
    };

    final observation = mapObservable.observe(onData);

    expect(invokes, [
      1,
      2,
      3,
    ]);

    observation.dispose();
  });

}
