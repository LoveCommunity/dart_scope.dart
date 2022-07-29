
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../../observables/shared/states_tester.dart';
import '../shared/mock_configurable.dart';
import '../shared/states_just.dart';

void main() {

  test('`FinalStatesBase` is sync configuration', () {

    final scope = Scope.root([
      FinalStatesBase<String>(
        name: null,
        equal: (_) => statesJust('a'),
        late: false,
      ),
    ]);

    expect(scope, isA<Scope>());
  });
  
  test('`FinalStatesBase` share same states in scope', () async {

    final scope = await Scope.root([
      FinalStatesBase<String>(
        name: null,
        equal: (_) => statesJust('a'),
        late: false,
      ),
    ]);

    final states1 = scope.get<States<String>>();
    final states2 = scope.get<States<String>>();

    final isIdentical = identical(states1, states2);

    expect(isIdentical, true);

  });

  test('`FinalStatesBase` share same states in scope with name', () async {

    final scope = await Scope.root([
      FinalStatesBase<String>(
        name: 'states',
        equal: (_) => statesJust('a'),
        late: false,
      ),
    ]);

    final states1 = scope.get<States<String>>(name: 'states');
    final states2 = scope.get<States<String>>(name: 'states');

    final isIdentical = identical(states1, states2);

    expect(isIdentical, true);

  });

  test('`FinalStatesBase` assign states which depends on other scope value', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<int>(expose: () => 0);
      }),
      FinalStatesBase<String>(
        name: null,
        equal: (scope) {
          final value = scope.get<int>().toString();
          return statesJust(value);
        },
        late: false,
      ),
    ]);

    final states = scope.get<States<String>>();
    final string = states.first;

    expect(string, '0');

  });
  
  test("`FinalStatesBase` exposed `States` won't forward data after scope disposed", () async {

    final scope = await Scope.root([
      FinalStatesBase<String>(
        name: null,
        equal: (_) => States((setState) {
          setState('a');
          Future(() => setState('b'));
          return Disposable.empty;
        }),
        late: false,
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

  test('`FinalStatesBase` assign states immediately when late is false', () async {

    int invokes = 0;

    await Scope.root([
      FinalStatesBase<Object>(
        name: null,
        equal: (_) {
          invokes += 1;
          return statesJust(Object());
        },
        late: false,
      ),
    ]);

    expect(invokes, 1);

  });
  
  test('`FinalStatesBase` assign states lazily when late is true', () async {

    int invokes = 0;

    final scope = await Scope.root([
      FinalStatesBase<Object>(
        name: null,
        equal: (_) {
          invokes += 1;
          return statesJust(Object());
        },
        late: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<Object>>();
    expect(invokes, 1);

  });
  
  test('`FinalStates` assign states immediately', () async {

    int invokes = 0;

    await Scope.root([
      FinalStates<Object>(
        equal: (_) {
          invokes += 1;
          return statesJust(Object());
        },
      ),
    ]);

    expect(invokes, 1);

  });
  
  test('`LateFinalStates` assign states lazily', () async {

    int invokes = 0;

    final scope = await Scope.root([
      LateFinalStates<Object>(
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
  
}
