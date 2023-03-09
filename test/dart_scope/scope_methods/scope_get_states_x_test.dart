
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

final _emptyStates = States<String>((_) {
  return Disposable.empty;
});

void main() {

  test('`scope.getStatesOrNull` return states if states exposed', () async {

    final scope = await Scope.root([
      Final<States<String>>(equal: (_) => _emptyStates),
    ]);

    final states = scope.getStatesOrNull<String>();

    expect(states, _emptyStates);
  });

  test('`scope.getStatesOrNull` return null if states not exposed', () async {

    final scope = await Scope.root([]);

    final states = scope.getStatesOrNull<String>();

    expect(states, null);
  });

  test('`scope.getStatesOrNull` return states if states exposed with name', () async {

    final scope = await Scope.root([
      Final<States<String>>(name: 'states', equal: (_) => _emptyStates),
    ]);

    final states = scope.getStatesOrNull<String>(name: 'states');

    expect(states, _emptyStates);
  });

  test('`scope.getStatesOrNull` return null if states not exposed with name', () async {

    final scope = await Scope.root([]);

    final states = scope.getStatesOrNull<String>(name: 'states');

    expect(states, null);
  });

  test('`scope.getStates` return states if states exposed', () async {

    final scope = await Scope.root([
      Final<States<String>>(equal: (_) => _emptyStates),
    ]);

    final states = scope.getStates<String>();

    expect(states, _emptyStates);
  });

  test('`scope.getStates` throws if states not exposed', () async {

    final scope = await Scope.root([]);

    expect(
      () {
        scope.getStates<String>();
      },
      throwsA(
        isA<ScopeValueNotExposedError<States<String>>>()
          .having(
            (error) => '$error',
            'description',
            contains('`States<String>` is not exposed in current scope'),
          )
      ),
    );
  });

  test('`scope.getStates` return states if states exposed with name', () async {

    final scope = await Scope.root([
      Final<States<String>>(name: 'states', equal: (_) => _emptyStates),
    ]);

    final states = scope.getStates<String>(name: 'states');

    expect(states, _emptyStates);
  });

  test('`scope.getStates` throws if states not exposed with name', () async {

    final scope = await Scope.root([]);

    expect(
      () {
        scope.getStates<String>(name: 'states');
      },
      throwsA(
        isA<ScopeValueNotExposedError<States<String>>>()
          .having(
            (error) => '$error',
            'description',
            contains('`States<String> states` is not exposed in current scope'),
          )
      ),
    );
  });

  test('`scope.hasStates` return true if states exposed', () async {

    final scope = await Scope.root([
      Final<States<String>>(equal: (_) => _emptyStates),
    ]);

    final hasStates = scope.hasStates<String>();

    expect(hasStates, true);
  });


  test('`scope.hasStates` return false if states not exposed', () async {

    final scope = await Scope.root([]);

    final hasStates = scope.hasStates<String>();

    expect(hasStates, false);
  });

  test('`scope.hasStates` return true if states exposed with name', () async {

    final scope = await Scope.root([
      Final<States<String>>(name: 'states', equal: (_) => _emptyStates),
    ]);

    final hasStates = scope.hasStates<String>(name: 'states');

    expect(hasStates, true);
  });

  test('`scope.hasStates` return false if states not exposed with name', () async {

    final scope = await Scope.root([]);

    final hasStates = scope.hasStates<String>(name: 'states');

    expect(hasStates, false);
  });
  
}