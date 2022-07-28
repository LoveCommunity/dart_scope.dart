// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'computed_test.dart';

// **************************************************************************
// ConfigurableComputedTestGenerator
// **************************************************************************

void _main() {
  test('`Computed2` is sync configuration', () {
    final scope = Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
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
        compute: (scope, it1, it2) {
          return '$it1|$it2';
        },
        late: false,
      ),
    ]);

    expect(scope, isA<Scope>());
  });

  test('`Computed3` is sync configuration', () {
    final scope = Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        scope.expose<States<String>>(
          name: 'states1',
          expose: () => states1,
        );
        scope.expose<States<String>>(
          name: 'states2',
          expose: () => states2,
        );
        scope.expose<States<String>>(
          name: 'states3',
          expose: () => states3,
        );
      }),
      Computed3<String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        compute: (scope, it1, it2, it3) {
          return '$it1|$it2|$it3';
        },
        late: false,
      ),
    ]);

    expect(scope, isA<Scope>());
  });

  test('`Computed2` share same instance in scope with name', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
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
        compute: (scope, it1, it2) {
          return '$it1|$it2';
        },
        late: false,
      ),
    ]);

    final computed1 = scope.get<States<String>>(name: 'computed');
    final computed2 = scope.get<States<String>>(name: 'computed');
    final isIdentical = identical(computed1, computed2);
    expect(isIdentical, true);
  });

  test('`Computed3` share same instance in scope with name', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        scope.expose<States<String>>(
          name: 'states1',
          expose: () => states1,
        );
        scope.expose<States<String>>(
          name: 'states2',
          expose: () => states2,
        );
        scope.expose<States<String>>(
          name: 'states3',
          expose: () => states3,
        );
      }),
      Computed3<String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        compute: (scope, it1, it2, it3) {
          return '$it1|$it2|$it3';
        },
        late: false,
      ),
    ]);

    final computed1 = scope.get<States<String>>(name: 'computed');
    final computed2 = scope.get<States<String>>(name: 'computed');
    final computed3 = scope.get<States<String>>(name: 'computed');
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
        compute: (scope, it1, it2) {
          return '$it1|$it2';
        },
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

  test('`Computed3` emit latest combined value when a source emit', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = States<String>((setState) {
          setState('1a');
          return Disposable.empty;
        });
        final states2 = States<String>((setState) {
          setState('2a');
          return Disposable.empty;
        });
        final states3 = States<String>((setState) {
          setState('3a');
          Future(() => setState('3b'));
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
        scope.expose<States<String>>(
          name: 'states3',
          expose: () => states3,
        );
      }),
      Computed3<String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        compute: (scope, it1, it2, it3) {
          return '$it1|$it2|$it3';
        },
        late: false,
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a', '1a|2a|3b']);

    tester.stopObserve();
  });

  test('`Computed2` compute with other scope value', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        scope.expose<States<String>>(
          name: 'states1',
          expose: () => states1,
        );
        scope.expose<States<String>>(
          name: 'states2',
          expose: () => states2,
        );
        scope.expose<int>(expose: () => 0);
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

  test('`Computed3` compute with other scope value', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        scope.expose<States<String>>(
          name: 'states1',
          expose: () => states1,
        );
        scope.expose<States<String>>(
          name: 'states2',
          expose: () => states2,
        );
        scope.expose<States<String>>(
          name: 'states3',
          expose: () => states3,
        );
        scope.expose<int>(expose: () => 0);
      }),
      Computed3<String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        compute: (scope, it1, it2, it3) {
          final value = scope.get<int>();
          return '$value|$it1|$it2|$it3';
        },
        late: false,
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final first = computed.first;
    expect(first, '0|1a|2a|3a');
  });

  test("`Computed2` exposed `States` won't forward data after scope disposed",
      () async {
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
        compute: (scope, it1, it2) {
          return '$it1|$it2';
        },
        late: false,
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    scope.dispose();

    expect(tester.recorded, <String>['1a|2a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a']);

    tester.stopObserve();
  });

  test("`Computed3` exposed `States` won't forward data after scope disposed",
      () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = States<String>((setState) {
          setState('1a');
          return Disposable.empty;
        });
        final states2 = States<String>((setState) {
          setState('2a');
          return Disposable.empty;
        });
        final states3 = States<String>((setState) {
          setState('3a');
          Future(() => setState('3b'));
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
        scope.expose<States<String>>(
          name: 'states3',
          expose: () => states3,
        );
      }),
      Computed3<String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        compute: (scope, it1, it2, it3) {
          return '$it1|$it2|$it3';
        },
        late: false,
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    scope.dispose();

    expect(tester.recorded, <String>['1a|2a|3a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a']);

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
        compute: (scope, it1, it2) {
          return '$it1|$it2';
        },
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

  test('`Computed3` default equals', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = States<String>((setState) {
          setState('1a');
          return Disposable.empty;
        });
        final states2 = States<String>((setState) {
          setState('2a');
          return Disposable.empty;
        });
        final states3 = States<String>((setState) {
          setState('3a');
          Future(() => setState('3a'));
          Future(() => setState('3b'));
          Future(() => setState('3b'));
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
        scope.expose<States<String>>(
          name: 'states3',
          expose: () => states3,
        );
      }),
      Computed3<String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        compute: (scope, it1, it2, it3) {
          return '$it1|$it2|$it3';
        },
        late: false,
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a', '1a|2a|3b']);

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
        compute: (scope, it1, it2) {
          return '$it1|$it2';
        },
        equals: (it1, it2) {
          return it1.length == it2.length;
        },
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

    expect(tester.recorded, <String>['1a|2a', '1a|2aa']);

    tester.stopObserve();
  });

  test('`Computed3` custom equals', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = States<String>((setState) {
          setState('1a');
          return Disposable.empty;
        });
        final states2 = States<String>((setState) {
          setState('2a');
          return Disposable.empty;
        });
        final states3 = States<String>((setState) {
          setState('3a');
          Future(() => setState('3b'));
          Future(() => setState('3aa'));
          Future(() => setState('3bb'));
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
        scope.expose<States<String>>(
          name: 'states3',
          expose: () => states3,
        );
      }),
      Computed3<String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        compute: (scope, it1, it2, it3) {
          return '$it1|$it2|$it3';
        },
        equals: (it1, it2) {
          return it1.length == it2.length;
        },
        late: false,
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a', '1a|2a|3aa']);

    tester.stopObserve();
  });

  test('`Computed2` compute immediately when late is false', () async {
    int invokes = 0;
    await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
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
        compute: (scope, it1, it2) {
          invokes += 1;
          return '$it1|$it2';
        },
        late: false,
      ),
    ]);

    expect(invokes, 1);
  });

  test('`Computed3` compute immediately when late is false', () async {
    int invokes = 0;
    await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        scope.expose<States<String>>(
          name: 'states1',
          expose: () => states1,
        );
        scope.expose<States<String>>(
          name: 'states2',
          expose: () => states2,
        );
        scope.expose<States<String>>(
          name: 'states3',
          expose: () => states3,
        );
      }),
      Computed3<String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        compute: (scope, it1, it2, it3) {
          invokes += 1;
          return '$it1|$it2|$it3';
        },
        late: false,
      ),
    ]);

    expect(invokes, 1);
  });

  test('`Computed2` compute immediately when late is true', () async {
    int invokes = 0;
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
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
        compute: (scope, it1, it2) {
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

  test('`Computed3` compute immediately when late is true', () async {
    int invokes = 0;
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        scope.expose<States<String>>(
          name: 'states1',
          expose: () => states1,
        );
        scope.expose<States<String>>(
          name: 'states2',
          expose: () => states2,
        );
        scope.expose<States<String>>(
          name: 'states3',
          expose: () => states3,
        );
      }),
      Computed3<String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        compute: (scope, it1, it2, it3) {
          invokes += 1;
          return '$it1|$it2|$it3';
        },
        late: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);
  });
}
