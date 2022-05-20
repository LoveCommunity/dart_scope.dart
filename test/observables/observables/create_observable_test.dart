
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';
import 'package:disposal/disposal.dart';
import '../../toolbox/async_toolbox.dart';

void main() {

  test('create observable sync', () {
    
    final List<String> invokes = [];

    final observable = Observable<String>((onData) {
      onData('a');
      return Disposable.empty;
    });

    final OnData<String> onData = (data) {
      invokes.add(data);
    };
    
    expect(invokes, []);
    final observation = observable.observe(onData);
    expect(invokes, [
      'a',
    ]);

    observation.dispose();

  });

  test('create observable async', () async {

    final List<String> invokes = [];

    final observable = Observable<String>((onData) {
      Future<void>(() => onData('a'));
      return Disposable.empty;
    });

    final OnData<String> onData = (data) {
      invokes.add(data);
    };

    expect(invokes, []);
    final observation = observable.observe(onData);
    expect(invokes, []);

    await delayed(30);
    expect(invokes, [
      'a',
    ]);

    observation.dispose();

  });

  test('create observable observation dispose', () {

    int invoked = 0;

    final observable = Observable<String>((onData) {
      return Disposable(() {
        invoked += 1;
      });
    });

    final observation = observable.observe((data) {});

    expect(invoked, 0);
    observation.dispose();
    expect(invoked, 1);
  });

  test('create observable not recieve data after disposed', () async {

    final List<String> invokes = [];

    final observable = Observable<String>((onData) {
      onData('a');
      Future<void>(() => onData('b'));
      return Disposable.empty;
    });
    
    final OnData<String> onData = (data) {
      invokes.add(data);
    };

    final observation = observable.observe(onData);

    expect(invokes, [
      'a',
    ]);
    
    observation.dispose();

    await delayed(30);
    expect(invokes, [
      'a',
    ]);
    
  });


}
