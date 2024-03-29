
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../shared/mock_configurable.dart';

void main() {

  test('AsyncFinal is async configuration', () {

    final scope = Scope.root([
      AsyncFinal<String>(equal: (_) async => 'a'),
    ]); 

    expect(scope, isA<Future<Scope>>());

  });

  test('AsyncFinal share same value in scope', () async {

    final scope = await Scope.root([
      AsyncFinal<Object>(equal: (_) async => Object()),
    ]);

    final object1 = scope.get<Object>();
    final object2 = scope.get<Object>();

    final isIdentical = identical(object1, object2);

    expect(isIdentical, true);

  });

  test('AsyncFinal share same value in scope with name', () async {

    final scope = await Scope.root([
      AsyncFinal<Object>(name: 'object', equal: (_) async => Object()),
    ]);

    final object1 = scope.get<Object>(name: 'object');
    final object2 = scope.get<Object>(name: 'object');

    final isIdentical = identical(object1, object2);

    expect(isIdentical, true);

  });

  test('AsyncFinal assign value which depends on other scope value', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<int>(expose: () => 0);
      }),
      AsyncFinal<String>(
        equal: (scope) async => scope.get<int>().toString(),
      ),
    ]);

    final string = scope.get<String>();

    expect(string, '0');

  });

  test('AsyncFinal expose value using custom expose', () async {

    final scope = await Scope.root([
      AsyncFinal<String>(
        equal: (_) async => 'a',
        expose: (scope, getValue) {
          scope.expose<Object>(expose: getValue);
        },
      ),
    ]); 

    final hasString = scope.has<String>();
    final hasObject = scope.has<Object>();

    expect(hasString, false);
    expect(hasObject, true);

  });

  test('AsyncFinal register value dispose logic using dispose', () async {

    int invokes = 0;

    final scope = await Scope.root([
      AsyncFinal<Disposable>(
        equal: (_) async => Disposable(() {
          invokes += 1;
        }),
        dispose: (value) => value.dispose(),
      ),
    ]);

    expect(invokes, 0);
    scope.dispose();
    expect(invokes, 1);

  });

  test('AsyncFinal assign value immediately', () async {

    int invokes = 0;

    await Scope.root([
      AsyncFinal<Object>(
        equal: (_) async {
          invokes += 1;
          return Object();
        },
      ),
    ]);

    expect(invokes, 1);

  });

}
