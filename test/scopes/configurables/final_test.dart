
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../shared/mock_configurable.dart';

void main() {

  test('`Final` is sync configuration', () {

    final scope = Scope.root([
      Final<String>(equal: (_) => 'a'),
    ]); 

    expect(scope, isA<Scope>());

  });

  test('`Final` share same instance in scope', () async {

    final scope = await Scope.root([
      Final<Object>(equal: (_) => Object()),
    ]);

    final object1 = scope.get<Object>();
    final object2 = scope.get<Object>();

    final isIdentical = identical(object1, object2);

    expect(isIdentical, true);

  });

  test('`Final` share same instance in scope with name', () async {

    final scope = await Scope.root([
      Final<Object>(name: 'object', equal: (_) => Object()),
    ]);

    final object1 = scope.get<Object>(name: 'object');
    final object2 = scope.get<Object>(name: 'object');

    final isIdentical = identical(object1, object2);

    expect(isIdentical, true);

  });

  test('`Final` assign value which depends on other scope value', () async {

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

  test('`Final` expose value using custom `expose`', () async {

    final scope = await Scope.root([
      Final<String>(
        equal: (_) => 'a',
        expose: (scope, getter) {
          scope.expose<Object>(expose: getter);
        },
      ),
    ]); 

    final string = scope.getOrNull<String>();
    final object = scope.getOrNull<Object>();

    expect(string, null);
    expect(object, 'a');

  });

  test('`Final` register instance dispose logic using `dispose`', () async {

    int invokes = 0;

    final scope = await Scope.root([
      Final<Disposable>(
        equal: (_) => Disposable(() {
          invokes += 1;
        }),
        dispose: (instance) => instance.dispose(),
      ),
    ]);

    expect(invokes, 0);
    scope.dispose();
    expect(invokes, 1);

  });

  test('`Final` assign instance immediately', () async {

    int invokes = 0;

    await Scope.root([
      Final<Object>(
        equal: (_) {
          invokes += 1;
          return Object();
        },
      ),
    ]);

    expect(invokes, 1);

  });

  test('`LateFinal` assign instance lazily', () async {

    int invokes = 0;

    final scope = await Scope.root([
      LateFinal<Object>(
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
}
