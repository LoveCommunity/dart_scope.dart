import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../shared/mock_configurable.dart';

void main() {

  test('`scope.addDisposables` before dispose', () async {

    final List<String> invokes = [];

    final configurable = MockConfigurable((scope) {

      final disposable1 = Disposable(() {
        invokes.add('dispose1');
      });
      final disposable2 = Disposable(() {
        invokes.add('dispose2');
      });

      scope.addDisposables([
        disposable1,
        disposable2,
      ]);

    });

    final scope = await Scope.root([
      configurable,
    ]);

    expect(invokes, []);
    scope.dispose();
    expect(invokes, [
      'dispose2',
      'dispose1',
    ]);
  
  });

  test('`scope.addDisposable` before dispose', () async {

    int invokes = 0;

    final configurable = MockConfigurable((scope) {

      final disposable = Disposable(() {
        invokes += 1;
      });

      scope.addDisposable(disposable);

    });

    final scope = await Scope.root([
      configurable,
    ]);

    expect(invokes, 0);
    scope.dispose();
    expect(invokes, 1);

  });

  test('`scope.addDisposables` after dispose', () async {

    final List<String> invokes = [];

    final configurable = MockConfigurable((scope) {

      final disposable1 = Disposable(() {
        invokes.add('dispose1');
      });
      final disposable2 = Disposable(() {
        invokes.add('dispose2');
      });

      Future(() {
        expect(invokes, []);
        scope.addDisposables([
          disposable1,
          disposable2,
        ]);
        expect(invokes, [
          'dispose2',
          'dispose1',
        ]);
      });
    });

    final scope = await Scope.root([
      configurable,
    ]);

    scope.dispose();

    await Future(() {});

  });
  
  test('`scope.addDisposable` after dispose', () async {

    int invokes = 0;

    final configurable = MockConfigurable((scope) {

      final disposable = Disposable(() {
        invokes += 1;
      });

      Future(() {
        expect(invokes, 0);
        scope.addDisposable(disposable);
        expect(invokes, 1);
      });

    });

    final scope = await Scope.root([
      configurable,
    ]);

    scope.dispose();

    await Future(() {});

  });
  
  test('`scope.dispose` multiple times', () async {

    int invokes = 0;

    final configurable = MockConfigurable((scope) {

      final disposable = Disposable(() {
        invokes += 1;
      });

      scope.addDisposable(disposable);

    });

    final scope = await Scope.root([
      configurable,
    ]);

    expect(invokes, 0);
    scope.dispose();
    expect(invokes, 1);
    scope.dispose();
    expect(invokes, 1);

  });

  test('`scope.addDispose` register dispose logic', () async {

    int invokes = 0;

    final configurable = MockConfigurable((scope) {

      scope.addDispose(() {
        invokes += 1;
      });

    });

    final scope = await Scope.root([
      configurable,
    ]);

    expect(invokes, 0);
    scope.dispose();
    expect(invokes, 1);

  });
}
