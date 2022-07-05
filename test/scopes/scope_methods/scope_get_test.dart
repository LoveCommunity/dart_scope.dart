import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../toolbox/mock_configurable.dart';

void main() {

  test('`scope.get` return value if value exposed', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<String>(expose: () => 'a');
      }),
    ]);

    final value = scope.get<String>();

    expect(value, 'a');

  });

  test('`scope.get` throws if value not exposed', () async {

    final scope = await Scope.root([]);

    expect(
      () {
        scope.get<String>();
      },
      throwsA(
        isA<ScopeValueNotExposedError<String>>()
          .having(
            (error) => '$error',
            'description',
            contains('`String` is not exposed in current scope'),
          ),
      )
    );

  });

  test('`scope.get` return value if value exposed with name', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<String>(
          name: 'state',
          expose: () => 'a',
        );
      }),
    ]);

    final value = scope.get<String>(name: 'state');

    expect(value, 'a');

  });

  test('`scope.get` throws if value not exposed with name', () async {

    final scope = await Scope.root([]);

    expect(
      () {
        scope.get<String>(name: 'state');
      },
      throwsA(
        isA<ScopeValueNotExposedError<String>>()
          .having(
            (error) => '$error',
            'description',
            contains('`String state` is not exposed in current scope'),
          ),
      )
    );

  });
}
