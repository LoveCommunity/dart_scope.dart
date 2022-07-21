
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../observables/shared/states_tester.dart';
import '../shared/mock_configurable.dart';

void main() {

  test('`FinalStatesBase` is sync configuration', () {

    final scope = Scope.root([
      FinalStatesBase<String>(
        name: null,
        equal: (_) => _statesJust('a'),
        expose: null,
        late: false,
      ),
    ]);

    expect(scope, isA<Scope>());
  });
  
  test('`FinalStatesBase` share same states in scope', () async {

    final scope = await Scope.root([
      FinalStatesBase<String>(
        name: null,
        equal: (_) => _statesJust('a'),
        expose: null,
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
        equal: (_) => _statesJust('a'),
        expose: null,
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
          return _statesJust(value);
        },
        expose: null,
        late: false,
      ),
    ]);

    final states = scope.get<States<String>>();
    final string = states.first;

    expect(string, '0');

  });
  
  test('`FinalStatesBase` expose states using custom `expose`', () async {

    final scope = await Scope.root([
      FinalStatesBase<String>(
        name: null,
        equal: (_) => _statesJust('a'),
        expose: (scope, getStates) {
          scope.expose<Object>(expose: getStates);
        },
        late: false,
      ),
    ]);

    final hasStates = scope.has<States<String>>();
    final hasObject = scope.has<Object>();

    expect(hasStates, false);
    expect(hasObject, true);

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
        expose: null,
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
          return _statesJust(Object());
        },
        expose: null,
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
          return _statesJust(Object());
        },
        expose: null,
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
          return _statesJust(Object());
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
          return _statesJust(Object());
        },
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<Object>>();
    expect(invokes, 1);

  });
  
}

States<T> _statesJust<T>(T value) => States((setState) {
  setState(value);
  return Disposable.empty;
});
