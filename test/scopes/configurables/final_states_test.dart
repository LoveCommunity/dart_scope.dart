
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

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
  
  test('`FinalStatesBase` share same instance in scope', () async {

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

  test('`FinalStatesBase` share same instance in scope with name', () async {

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
        expose: (scope, getter) {
          scope.expose<Object>(expose: getter);
        },
        late: false,
      ),
    ]);

    final states = scope.getOrNull<States<String>>();
    final object = scope.getOrNull<Object>();

    expect(states, null);
    expect(object, isNotNull);

    final string = (object as States<String>).first;

    expect(string, 'a');

  });

  test('`FinalStatesBase` assign instance immediately when late is false', () async {

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
  
  test('`FinalStatesBase` assign instance lazily when late is true', () async {

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
  
  test('`FinalStates` assign instance immediately', () async {

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
  
  test('`LateFinalStates` assign instance lazily', () async {

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
