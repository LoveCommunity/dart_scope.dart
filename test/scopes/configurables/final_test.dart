
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../shared/mock_configurable.dart';

void main() {

  test('`FinalBase` is sync configuration', () {

    final scope = Scope.root([
      FinalBase<String>(
        name: null,
        equal: (_) => 'a',
        expose: null,
        dispose: null,
        late: true,
      ),
    ]); 

    expect(scope, isA<Scope>());

  });

  test('`FinalBase` share same instance in scope', () async {

    final scope = await Scope.root([
      FinalBase<Object>(
        name: null,
        equal: (_) => Object(),
        expose: null,
        dispose: null,
        late: true,
      ),
    ]);

    final object1 = scope.get<Object>();
    final object2 = scope.get<Object>();

    final isIdentical = identical(object1, object2);

    expect(isIdentical, true);

  });

  test('`FinalBase` share same instance in scope with name', () async {

    final scope = await Scope.root([
      FinalBase<Object>(
        name: 'object', 
        equal: (_) => Object(),
        expose: null,
        dispose: null,
        late: true,
      ),
    ]);

    final object1 = scope.get<Object>(name: 'object');
    final object2 = scope.get<Object>(name: 'object');

    final isIdentical = identical(object1, object2);

    expect(isIdentical, true);

  });

  test('`FinalBase` assign value which depends on other scope value', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<int>(expose: () => 0);
      }),
      FinalBase<String>(
        name: null,
        equal: (scope) => scope.get<int>().toString(),
        expose: null,
        dispose: null,
        late: true,
      ),
    ]);

    final string = scope.get<String>();

    expect(string, '0');

  });

  test('`FinalBase` expose value using custom `expose`', () async {

    final scope = await Scope.root([
      FinalBase<String>(
        name: null,
        equal: (_) => 'a',
        expose: (scope, getter) {
          scope.expose<Object>(expose: getter);
        },
        dispose: null,
        late: true,
      ),
    ]); 

    final string = scope.getOrNull<String>();
    final object = scope.getOrNull<Object>();

    expect(string, null);
    expect(object, 'a');

  });

  test('`FinalBase` register instance dispose logic using `dispose`', () async {

    int invokes = 0;

    final scope = await Scope.root([
      FinalBase<Disposable>(
        name: null,
        equal: (_) => Disposable(() {
          invokes += 1;
        }),
        expose: null,
        dispose: (instance) => instance.dispose(),
        late: true,
      ),
    ]);

    expect(invokes, 0);
    scope.dispose();
    expect(invokes, 1);

  });

  test('`FinalBase` assign instance lazily when late is true', () async {

    int invokes = 0;

    final scope = await Scope.root([
      FinalBase<Object>(
        name: null,
        equal: (_) {
          invokes += 1;
          return Object();
        },
        expose: null,
        dispose: null,
        late: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<Object>();
    expect(invokes, 1);

  });

  test('`FinalBase` assign instance immediately when late is false', () async {

    int invokes = 0;

    await Scope.root([
      FinalBase<Object>(
        name: null,
        equal: (_) {
          invokes += 1;
          return Object();
        },
        expose: null,
        dispose: null,
        late: false,
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
}
