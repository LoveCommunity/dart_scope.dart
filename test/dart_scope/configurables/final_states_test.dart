
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../../dart_observable/shared/states_tester.dart';
import '../shared/mock_configurable.dart';
import '../shared/states_just.dart';

void main() {

  test('`FinalStates` is sync configuration', () {

    final scope = Scope.root([
      FinalStates<String>(
        equal: (_) => statesJust('a'),
      ),
    ]);

    expect(scope, isA<Scope>());
  });
  
  test('`FinalStates` share same states in scope', () async {

    final scope = await Scope.root([
      FinalStates<String>(
        equal: (_) => statesJust('a'),
      ),
    ]);

    final states1 = scope.get<States<String>>();
    final states2 = scope.get<States<String>>();

    final isIdentical = identical(states1, states2);

    expect(isIdentical, true);

  });

  test('`FinalStates` share same states in scope with name', () async {

    final scope = await Scope.root([
      FinalStates<String>(
        name: 'states',
        equal: (_) => statesJust('a'),
      ),
    ]);

    final states1 = scope.get<States<String>>(name: 'states');
    final states2 = scope.get<States<String>>(name: 'states');

    final isIdentical = identical(states1, states2);

    expect(isIdentical, true);

  });

  test('`FinalStates` assign states which depends on other scope value', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<int>(expose: () => 0);
      }),
      FinalStates<String>(
        equal: (scope) {
          final value = scope.get<int>().toString();
          return statesJust(value);
        },
      ),
    ]);

    final states = scope.get<States<String>>();
    final string = states.first;

    expect(string, '0');

  });
  
  test("`FinalStates` exposed `States` won't forward data after scope disposed", () async {

    final scope = await Scope.root([
      FinalStates<String>(
        equal: (_) => States((setState) {
          setState('a');
          Future(() => setState('b'));
          return Disposable.empty;
        }),
      ),
    ]);

    final states = scope.get<States<String>>();

    final tester = StatesTester(
      states,
    );

    tester.startObserve();

    scope.dispose();

    expect(tester.recorded, [
      'a',
    ]);
    await Future(() {});
    expect(tester.recorded, [
      'a',
    ]);

  });

  test('`FinalStates` assign states lazily when `lazy` is omitted', () async {

    int invokes = 0;

    final scope = await Scope.root([
      FinalStates<Object>(
        equal: (_) {
          invokes += 1;
          return statesJust(Object());
        },
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<Object>>();
    expect(invokes, 1);

  });
  
  test('`FinalStates` assign states lazily when `lazy` is true', () async {

    int invokes = 0;

    final scope = await Scope.root([
      FinalStates<Object>(
        equal: (_) {
          invokes += 1;
          return statesJust(Object());
        },
        lazy: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<Object>>();
    expect(invokes, 1);

  });

  test('`FinalStates` assign states immediately when `lazy` is false', () async {

    int invokes = 0;

    final scope = await Scope.root([
      FinalStates<Object>(
        equal: (_) {
          invokes += 1;
          return statesJust(Object());
        },
        lazy: false,
      ),
    ]);

    expect(invokes, 1);
    scope.get<States<Object>>();
    expect(invokes, 1);

  });
  
}
