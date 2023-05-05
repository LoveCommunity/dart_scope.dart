
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../shared/mock_configurable.dart';

void main() {

  test('Final is sync configuration', () {

    final scope = Scope.root([
      Final<String>(
        equal: (_) => 'a',
      ),
    ]); 

    expect(scope, isA<Scope>());

  });

  test('Final share same value in scope', () async {

    final scope = await Scope.root([
      Final<Object>(
        equal: (_) => Object(),
      ),
    ]);

    final object1 = scope.get<Object>();
    final object2 = scope.get<Object>();

    final isIdentical = identical(object1, object2);

    expect(isIdentical, true);

  });

  test('Final share same value in scope with name', () async {

    final scope = await Scope.root([
      Final<Object>(
        name: 'object', 
        equal: (_) => Object(),
      ),
    ]);

    final object1 = scope.get<Object>(name: 'object');
    final object2 = scope.get<Object>(name: 'object');

    final isIdentical = identical(object1, object2);

    expect(isIdentical, true);

  });

  test('Final assign value which depends on other scope value', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<int>(expose: () => 0);
      }),
      Final<String>(
        equal: (scope) => scope.get<int>().toString(),
      ),
    ]);

    final string = scope.get<String>();

    expect(string, '0');

  });

  test('Final expose value using custom expose', () async {

    final scope = await Scope.root([
      Final<String>(
        equal: (_) => 'a',
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

  test('Final register value dispose logic using dispose', () async {

    int invokes = 0;

    final scope = await Scope.root([
      Final<Disposable>(
        equal: (_) => Disposable(() {
          invokes += 1;
        }),
        dispose: (value) => value.dispose(),
      ),
    ]);

    expect(invokes, 0);
    scope.dispose();
    expect(invokes, 1);

  });

  test('Final assign value lazily when lazy is omitted', () async {

    int invokes = 0;

    final scope = await Scope.root([
      Final<Object>(
        equal: (_) {
          invokes += 1;
          return Object();
        },
      ),
    ]);

    expect(invokes, 0);
    scope.get<Object>();
    expect(invokes, 1);

  });

  test('Final assign value lazily when lazy is true', () async {

    int invokes = 0;

    final scope = await Scope.root([
      Final<Object>(
        equal: (_) {
          invokes += 1;
          return Object();
        },
        lazy: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<Object>();
    expect(invokes, 1);

  });

  test('Final assign value immediately when lazy is false', () async {

    int invokes = 0;

    final scope = await Scope.root([
      Final<Object>(
        equal: (_) {
          invokes += 1;
          return Object();
        },
        lazy: false,
      ),
    ]);

    expect(invokes, 1);
    scope.get<Object>();
    expect(invokes, 1);

  });
}
