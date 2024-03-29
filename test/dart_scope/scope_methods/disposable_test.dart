import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../shared/mock_configurable.dart';

void main() {

  test('scope.addDisposables before dispose', () async {

    final invokes = <String>[];

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

    expect(invokes, <String>[]);
    scope.dispose();
    expect(invokes, [
      'dispose2',
      'dispose1',
    ]);
  
  });

  test('scope.addDisposable before dispose', () async {

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

  test('scope.addDisposables after dispose', () async {

    final invokes = <String>[];

    final configurable = MockConfigurable((scope) {

      final disposable1 = Disposable(() {
        invokes.add('dispose1');
      });
      final disposable2 = Disposable(() {
        invokes.add('dispose2');
      });

      Future(() {
        expect(invokes, <String>[]);
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
  
  test('scope.addDisposable after dispose', () async {

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
  
  test('scope.dispose multiple times', () async {

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

  test('scope auto dispose if sync configuration throw error', () async {

    int invokes = 0;
    Object? error;

    // ignore: void_checks
    final configurable = MockConfigurable((scope) {

      final disposable = Disposable(() {
        invokes += 1;
      });

      scope.addDisposable(disposable);

      throw 'error';

    });

    try {
      await Scope.root([
        configurable,
      ]);
    } catch(e) {
      error = e;
    }
    
    expect(invokes, 1);
    expect(error, 'error');
    
  });

  test('scope auto dispose if async configuration throw error', () async {

    int invokes = 0;
    Object? error;

    final configurable = MockConfigurable((scope) async {

      final disposable = Disposable(() {
        invokes += 1;
      });

      scope.addDisposable(disposable);

      throw 'error';

    });

    try {
      await Scope.root([
        configurable,
      ]);
    } catch(e) {
      error = e;
    }
    
    expect(invokes, 1);
    expect(error, 'error');
    
  });

  test('scope.addDispose register dispose logic', () async {

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
