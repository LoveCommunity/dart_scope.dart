
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

void main() {

  test('Configurable.defaultConstructor invoked', () async {

    int invokes = 0;
    
    await Scope.root([
      Configurable((scope) {
        invokes += 1;
      }),
    ]);

    expect(invokes, 1);

  });

  test('Configurable.defaultConstructor configure scope success', () async {

    final scope = await Scope.root([
      Configurable((scope) {
        scope.expose<String>(expose: () => 'a');
      }),
    ]);

    final value = scope.get<String>();

    expect(value, 'a');
  });


  test('Configurable.defaultConstructor make sync scope if configuration is sync', () {

    final scope = Scope.root([
      Configurable((scope) {}),
    ]);

    expect(scope, isA<Scope>());
  });

  test('Configurable.defaultConstructor make async scope if configuration is async', () {

    final scope = Scope.root([
      Configurable((scope) async {}),
    ]);

    expect(scope, isA<Future<Scope>>());
  });
}
