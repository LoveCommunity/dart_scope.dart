
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../observables/shared/states_tester.dart';
import '../shared/mock_configurable.dart';
import '../shared/states_just.dart';

void main() {

  test('`Computed` is sync configuration', () {

    final scope = Scope.root([
      MockConfigurable((scope) {
        scope.expose<States<String>>(
          name: 'states',
          expose: () => statesJust('a'),
        );
      }),
      Computed<String, String>(
        name: 'computed',
        statesName: 'states',
        compute: (_, it) => '1$it', 
        late: false,
      ),
    ]);

    expect(scope, isA<Scope>());

  });

  test('`Computed` share same instance in scope with name', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<States<String>>(
          name: 'states',
          expose: () => statesJust('a'),
        );
      }),
      Computed<String, String>(
        name: 'computed',
        statesName: 'states',
        compute: (_, it) => '1$it', 
        late: false,
      ),
    ]);

    final computed1 = scope.get<States<String>>(name: 'computed');
    final computed2 = scope.get<States<String>>(name: 'computed');

    final isIdentical = identical(computed1, computed2);

    expect(isIdentical, true);

  });

  test('`Computed` compute with other scope value', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<States<String>>(
          name: 'states',
          expose: () => statesJust('a'),
        );
        scope.expose<int>(expose: () => 0);
      }),
      Computed<String, String>(
        name: 'computed',
        statesName: 'states',
        compute: (scope, it) {
          final value = scope.get<int>();
          return '$value$it';
        }, 
        late: false,
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');

    final first = computed.first;
    
    expect(first, '0a');

  });

  test("`Computed` exposed `States` won't forward data after scope disposed", () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states = States<String>((setState) {
          setState('a');
          Future(() => setState('b'));
          return Disposable.empty;
        });
        scope.expose<States<String>>(
          name: 'states',
          expose: () => states,
        );
      }),
      Computed<String, String>(
        name: 'computed',
        statesName: 'states',
        compute: (_, it) => '1$it', 
        late: false,
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    scope.dispose();

    expect(tester.recorded, [
      '1a',
    ]);
    await Future(() {});
    expect(tester.recorded, [
      '1a',
    ]);

    tester.stopObserve();

  });

  test('`Computed` default equals', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states = States<String>((setState) {
          setState('a');
          Future(() => setState('a'));
          Future(() => setState('b'));
          Future(() => setState('b'));
          return Disposable.empty;
        });
        scope.expose<States<String>>(
          name: 'states',
          expose: () => states,
        );
      }),
      Computed<String, String>(
        name: 'computed',
        statesName: 'states',
        compute: (_, it) => '1$it', 
        late: false,
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, [
      '1a',
    ]);
    await Future(() {});
    expect(tester.recorded, [
      '1a',
      '1b',
    ]);

    tester.stopObserve();

  });

  test('`Computed` custom equals', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states = States<String>((setState) {
          setState('a');
          Future(() => setState('b'));
          Future(() => setState('aa'));
          Future(() => setState('bb'));
          return Disposable.empty;
        });
        scope.expose<States<String>>(
          name: 'states',
          expose: () => states,
        );
      }),
      Computed<String, String>(
        name: 'computed',
        statesName: 'states',
        compute: (_, it) => '1$it', 
        equals: (it1, it2) => it1.length == it2.length,
        late: false,
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, [
      '1a',
    ]);
    await Future(() {});
    expect(tester.recorded, [
      '1a',
      '1aa',
    ]);

    tester.stopObserve();

  });

  test('`Computed` compute immediately when late is false', () async {

    int invokes = 0;

    await Scope.root([
      MockConfigurable((scope) {
        scope.expose<States<String>>(
          name: 'states',
          expose: () => statesJust('a'),
        );
      }),
      Computed<String, String>(
        name: 'computed',
        statesName: 'states',
        compute: (_, it) {
          invokes += 1;
          return '1$it';
        }, 
        late: false,
      ),
    ]);

    expect(invokes, 1);

  });

  test('`Computed` compute lazily when late is true', () async {

    int invokes = 0;

    final scope = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<States<String>>(
          name: 'states',
          expose: () => statesJust('a'),
        );
      }),
      Computed<String, String>(
        name: 'computed',
        statesName: 'states',
        compute: (_, it) {
          invokes += 1;
          return '1$it';
        }, 
        late: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);

  });

  test('`Computed2` is sync configuration', () {

    final scope = Scope.root([
      MockConfigurable((scope) {
        scope.expose<States<String>>(
          name: 'states1',
          expose: () => statesJust('1a'),
        );
        scope.expose<States<String>>(
          name: 'states2',
          expose: () => statesJust('2a'),
        );
      }),
      Computed2<String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        compute: (_, it1, it2) => '$it1|$it2', 
        late: false,
      ),
    ]);

    expect(scope, isA<Scope>());

  });

  test('`Computed2` share same instance in scope with name', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<States<String>>(
          name: 'states1',
          expose: () => statesJust('1a'),
        );
        scope.expose<States<String>>(
          name: 'states2',
          expose: () => statesJust('2a'),
        );
      }),
      Computed2<String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        compute: (_, it1, it2) => '$it1|$it2', 
        late: false,
      ),
    ]);

    final computed1 = scope.get<States<String>>(name: 'computed');
    final computed2 = scope.get<States<String>>(name: 'computed');

    final isIdentical = identical(computed1, computed2);

    expect(isIdentical, true);

  });

  test('`Computed2` emit latest combined value when a source emit', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {

        final states1 = States<String>((setState) {
          setState('1a');
          return Disposable.empty;
        });

        final states2 = States<String>((setState) {
          setState('2a');
          Future(() => setState('2b'));
          return Disposable.empty;
        });

        scope.expose<States<String>>(
          name: 'states1',
          expose: () => states1,
        );
        scope.expose<States<String>>(
          name: 'states2',
          expose: () => states2,
        );

      }),
      Computed2<String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        compute: (_, it1, it2) => '$it1|$it2',
        late: false,
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a', '1a|2b']);

    tester.stopObserve();

  });

  test('`Computed2` compute with other scope value', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<States<String>>(
          name: 'states1',
          expose: () => statesJust('1a'),
        );
        scope.expose<States<String>>(
          name: 'states2',
          expose: () => statesJust('2a'),
        );
        scope.expose<int>(
          expose: () => 0
        );
      }),
      Computed2<String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        compute: (scope, it1, it2) {
          final value = scope.get<int>();
          return '$value|$it1|$it2';
        },
        late: false,
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');

    final first = computed.first;
    
    expect(first, '0|1a|2a');

  });

  test("`Computed2` exposed `States` won't forward data after scope disposed", () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = States<String>((setState) {
          setState('1a');
          return Disposable.empty;
        });
        final states2 = States<String>((setState) {
          setState('2a');
          Future(() => setState('2b'));
          return Disposable.empty;
        });
        scope.expose<States<String>>(
          name: 'states1',
          expose: () => states1,
        );
        scope.expose<States<String>>(
          name: 'states2',
          expose: () => states2,
        );
      }),
      Computed2<String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        compute: (_, it1, it2) => '$it1|$it2',
        late: false,
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    scope.dispose();
    
    expect(tester.recorded, <String>[
      '1a|2a',
    ]);
    await Future(() {});
    expect(tester.recorded, <String>[
      '1a|2a',
    ]);

    tester.stopObserve();

  });

  test('`Computed2` default equals', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = States<String>((setState) {
          setState('1a');
          return Disposable.empty;
        });
        final states2 = States<String>((setState) {
          setState('2a');
          Future(() => setState('2a'));
          Future(() => setState('2b'));
          Future(() => setState('2b'));
          return Disposable.empty;
        });
        scope.expose<States<String>>(
          name: 'states1',
          expose: () => states1,
        );
        scope.expose<States<String>>(
          name: 'states2',
          expose: () => states2,
        );
      }),
      Computed2<String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        compute: (_, it1, it2) => '$it1|$it2',
        late: false,
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();
    
    expect(tester.recorded, <String>[
      '1a|2a',
    ]);
    await Future(() {});
    expect(tester.recorded, <String>[
      '1a|2a',
      '1a|2b',
    ]);

    tester.stopObserve();

  });

  test('`Computed2` custom equals', () async {

    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = States<String>((setState) {
          setState('1a');
          return Disposable.empty;
        });
        final states2 = States<String>((setState) {
          setState('2a');
          Future(() => setState('2b'));
          Future(() => setState('2aa'));
          Future(() => setState('2bb'));
          return Disposable.empty;
        });
        scope.expose<States<String>>(
          name: 'states1',
          expose: () => states1,
        );
        scope.expose<States<String>>(
          name: 'states2',
          expose: () => states2,
        );
      }),
      Computed2<String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        compute: (_, it1, it2) => '$it1|$it2',
        equals: (it1, it2) => it1.length == it2.length,
        late: false,
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');

    final tester = StatesTester(
      computed,
    );

    tester.startObserve();
    
    expect(tester.recorded, <String>[
      '1a|2a',
    ]);
    await Future(() {});
    expect(tester.recorded, <String>[
      '1a|2a',
      '1a|2aa',
    ]);

    tester.stopObserve();

  });

  test('`Computed2` compute immediately when late is false', () async {

    int invokes = 0;

    await Scope.root([
      MockConfigurable((scope) {
        scope.expose<States<String>>(
          name: 'states1',
          expose: () => statesJust('1a'),
        );
        scope.expose<States<String>>(
          name: 'states2',
          expose: () => statesJust('2a'),
        );
      }),
      Computed2<String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        compute: (_, it1, it2) {
          invokes += 1;
          return '$it1|$it2';
        }, 
        late: false,
      ),
    ]);

    expect(invokes, 1);

  });

  test('`Computed2` compute lazily when late is true', () async {

    int invokes = 0;

    final scope = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<States<String>>(
          name: 'states1',
          expose: () => statesJust('1a'),
        );
        scope.expose<States<String>>(
          name: 'states2',
          expose: () => statesJust('2a'),
        );
      }),
      Computed2<String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        compute: (_, it1, it2) {
          invokes += 1;
          return '$it1|$it2';
        }, 
        late: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);

  });
}
