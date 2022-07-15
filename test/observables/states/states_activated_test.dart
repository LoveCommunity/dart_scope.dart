
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../shared/states_tester.dart';

void main() {
  
  test('`states.activated` connect immediately', () {

    int invokes = 0;

    final states = States<String>((setState) {
      setState('a');
      invokes += 1;
      return Disposable.empty;
    });

    expect(invokes, 0);
    final activated = states.activated();
    expect(invokes, 1);

    activated.dispose();

  });
  
  test('`states.activated` disconnect when dispose(deactivate) called', () {

    int invokes = 0;

    final states = States<String>((setState) {
      setState('a');
      return Disposable(() {
        invokes += 1;
      });
    });

    final activated = states.activated();

    expect(invokes, 0);
    activated.dispose();
    expect(invokes, 1);

  });
  
  test('`states.activated` forward data to observers', () async {

    final states = States<String>((setState) {
      setState('a');
      Future(() => setState('b'));
      return Disposable.empty;
    });

    final activated = states.activated();
    
    final tester1 = StatesTester(
      activated.states,
    );
    
    final tester2 = StatesTester(
      activated.states,
    );

    tester1.startObserve();
    tester2.startObserve();

    expect(tester1.recorded, [
      'a',
    ]);
    expect(tester2.recorded, [
      'a',
    ]);
    await Future(() {});
    expect(tester1.recorded, [
      'a',
      'b',
    ]);
    expect(tester2.recorded, [
      'a',
      'b',
    ]);

    tester1.stopObserve();
    tester2.stopObserve();

    activated.dispose();

  });
  
  test('`states.activated` replay data to observers', () {

    final states = States<String>((setState) {
      setState('a');
      setState('b');
      setState('c');
      return Disposable.empty;
    });

    final activated = states.activated();

    final tester = StatesTester(
      activated.states,
    );

    expect(tester.recorded, []);
    tester.startObserve();
    expect(tester.recorded, [
      'c',
    ]);

    tester.stopObserve();
    activated.dispose();
  });
  
  test("`states.activated` won't forward data after disposed(deactivated)", () async {
    
    final states = States<String>((setState) {
      setState('a');
      Future(() => setState('b'));
      return Disposable.empty;
    });

    final activated = states.activated();
    
    final tester = StatesTester(
      activated.states,
    );

    tester.startObserve();
    activated.dispose();
    
    expect(tester.recorded, [
      'a',
    ]);
    await Future(() {});
    expect(tester.recorded, [
      'a',
    ]);

    tester.stopObserve();

  });
}
