
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../shared/mock_configurable.dart';

void main() {

  test('`scope.push` return sync scope if it only has sync configuration', () async {

    final parent = await Scope.root([]);

    final scope = parent.push([
      MockConfigurable((_) {}),
    ]);

    expect(scope, isA<Scope>());
  });

  test('`scope.push` return async scope if it has async configuration', () async {

    final parent = await Scope.root([]);

    final scope = parent.push([
      MockConfigurable((_) async {}),
    ]);

    expect(scope, isA<Future<Scope>>());
  });

  test('`scope.push` returned scope has no value if value not exposed', () async {

    final parent = await Scope.root([]);

    final scope = await parent.push([]);
    
    final hasValue = scope.has<String>();
    final value = scope.getOrNull<String>();

    expect(hasValue, false);
    expect(value, null);
  });

  test('`scope.push` returned scope has value if value exposed', () async {

    final parent = await Scope.root([]);

    final scope = await parent.push([
      MockConfigurable((scope) {
        scope.expose<String>(expose: () => 'a');
      }),
    ]);
    
    final hasValue = scope.has<String>();
    final value = scope.getOrNull<String>();

    expect(hasValue, true);
    expect(value, 'a');
  });

  test('`scope.push` returned scope inherit values from parent scope', () async {

    final parent = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<String>(expose: () => 'parent');
      }),
    ]);

    final scope = await parent.push([]);

    final hasValue = scope.has<String>();
    final value = scope.getOrNull<String>();

    expect(hasValue, true);
    expect(value, 'parent');
  });

}
