import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../shared/mock_configurable.dart';

void main() {

  test('`Configurable.combine` invokes', () async {

    final List<String> invokes = [];

    final configurable1 = MockConfigurable((scope) {
      invokes.add('configure1');
    });

    final configurable2 = MockConfigurable((scope) {
      invokes.add('configure2');
    });

    final combine = Configurable.combine(
      children: [
        configurable1,
        configurable2,
      ],
    );

    expect(invokes, []);
    await Scope.root([
      combine,
    ]);
    expect(invokes, [
      'configure1',
      'configure2',
    ]);

  });

  test('`Configurable.combine` configure scope success', () async {

    final configurable1 = MockConfigurable((scope) {
      scope.expose<String>(
        name: 'stateA',
        expose: () => 'a',
      );
    });

    final configurable2 = MockConfigurable((scope) {
      scope.expose<String>(
        name: 'stateB',
        expose: () => 'b',
      );
    });

    final combine = Configurable.combine(
      children: [
        configurable1,
        configurable2,
      ],
    );

    final scope = await Scope.root([
      combine,
    ]);

    final stateA = scope.get<String>(name: 'stateA');
    final stateB = scope.get<String>(name: 'stateB');

    expect(stateA, 'a');
    expect(stateB, 'b');

  });

  test('`Configurable.combine` make sync scope if children only has sync configuration', () {

    final combine = Configurable.combine(
      children: [
        MockConfigurable((scope) {}),
      ],
    );

    final scope = Scope.root([
      combine,
    ]);

    expect(scope, isA<Scope>());

  });

  test('`Configurable.combine` make async scope if children has async configuration', () {

    final combine = Configurable.combine(
      children: [
        MockConfigurable((scope) async {}),
      ],
    );

    final scope = Scope.root([
      combine,
    ]);

    expect(scope, isA<Future<Scope>>());

  });

}

