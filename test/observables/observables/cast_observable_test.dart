
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

void main() {

  test('cast observable success', () {

    final List<Object> invokes = [];

    final observable = Observable<String>((onData) {
      onData('a');
      return Disposable.empty;
    }); 

    final castObservable = observable.cast<Object>();

    final OnData<Object> onData = (data) {
      invokes.add(data);
    };

    expect(invokes, []);
    final observation = castObservable.observe(onData);
    expect(invokes, [
      'a',
    ]);

    observation.dispose();
  });

  test('cast observable failure', () {

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
