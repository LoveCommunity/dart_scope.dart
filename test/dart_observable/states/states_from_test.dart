
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

void main() {

  test("States.from's observable is identical to observable passed in", () {

    final observable = Observable<String>((onData) {
      return Disposable.empty;
    });
    
    final states = States.from(observable);

    expect(states.observable, observable);

  });
  
  test("states.observe cause observable observe", () {

    int invokes = 0;

    final observable = Observable<String>((onData) {
      invokes += 1;
      return Disposable.empty;
    });

    final states = States.from(observable);

    expect(invokes, 0);
    final observation = states.observe((_) {});
    expect(invokes, 1);

    observation.dispose();
  });

  test("states's observation dispose cause observable's observation dispose", () {

    int invokes = 0;

    final observable = Observable<String>((onData) {
      return Disposable(() {
        invokes += 1;
      });
    });

    final states = States.from(observable);

    final observation = states.observe((_) {});

    expect(invokes, 0);
    observation.dispose();
    expect(invokes, 1);

  });
}
