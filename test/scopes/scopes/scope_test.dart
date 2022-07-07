import 'dart:async';
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../shared/mock_configurable.dart';

void main() {

  test('`scope` is `ScopeGet`, `ScopePush` and `Disposable`', () {

    final scope = _MockScope();

    expect(scope, isA<ScopeGet>());
    expect(scope, isA<ScopePush>());
    expect(scope, isA<Disposable>());
  });

  test('`Scope.root` return sync scope if it only has sync configuration', () {

    final scope = Scope.root([
      MockConfigurable((_) {}),
    ]);

    expect(scope, isA<Scope>());
  });

  test('`Scope.root` return async scope if it has async configuration', () {
    
    final scope = Scope.root([
      MockConfigurable((_) async {}),
    ]);

    expect(scope, isA<Future<Scope>>());
  });

  test('`scope.has` return false if value not exposed', () async {
    
    final scope = await Scope.root([]);

    final hasValue = scope.has<String>();

    expect(hasValue, false);
  });

  test('`scope.has` return true if value exposed', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<String>(expose: () => 'a');
      }),
    ]);

    final hasValue = scope.has<String>();

    expect(hasValue, true);
  });

  test('`scope.has` return false if value not exposed with name', () async {
    
    final scope = await Scope.root([]);

    final hasValue = scope.has<String>(name: 'state');

    expect(hasValue, false);
  });

  test('`scope.has` return true if value exposed with name', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<String>(
          name: 'state',
          expose: () => 'a',
        );
      }),
    ]);

    final hasValue = scope.has<String>(name: 'state');

    expect(hasValue, true);
  });

  test('`scope.getOrNull` return null if value not exposed', () async {
    
    final scope = await Scope.root([]);

    final value = scope.getOrNull<String>();

    expect(value, null);
  });

  test('`scope.getOrNull` return value if value exposed', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<String>(expose: () => 'a');
      }),
    ]);

    final value = scope.getOrNull<String>();

    expect(value, 'a');
  });

  test('`scope.getOrNull` return null if value not exposed with name', () async {

    final scope = await Scope.root([]);

    final value = scope.getOrNull<String>(name: 'state');

    expect(value, null);
  });

  test('`scope.getOrNull` return value if value exposed with name', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<String>(
          name: 'state',
          expose: () => 'a',
        );
      }),
    ]);

    final value = scope.getOrNull<String>(name: 'state');

    expect(value, 'a');
  });

  test('`scope.getOrNull` return value if value exposed with name using async configuration', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) async {
        scope.expose<String>(
          name: 'state',
          expose: () => 'a',
        );
      }),
    ]);

    final value = scope.getOrNull<String>(name: 'state');

    expect(value, 'a');
  });
}

class _MockScope implements Scope {

  @override
  T? getOrNull<T>({
    Object? name,
  }) => throw UnimplementedError();

  @override
  bool has<T>({
    Object? name,
  }) => throw UnimplementedError();

  @override
  FutureOr<Scope> push(
    List<Configurable> configure,
  ) => throw UnimplementedError();

  @override
  void dispose() {
    throw UnimplementedError();
  }
}
