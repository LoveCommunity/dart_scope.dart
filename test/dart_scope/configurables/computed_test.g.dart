// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'computed_test.dart';

// **************************************************************************
// ConfigurableComputedTestGenerator
// **************************************************************************

void _main() {
  test('Computed2 is sync configuration', () {
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
      ),
    ]);

    expect(scope, isA<Scope>());
  });

  test('Computed3 is sync configuration', () {
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
      ),
    ]);

    expect(scope, isA<Scope>());
  });

  test('Computed4 is sync configuration', () {
    final scope = Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
      }),
      Computed4<String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        compute: (scope, it1, it2, it3, it4) {
          return '$it1|$it2|$it3|$it4';
        },
      ),
    ]);

    expect(scope, isA<Scope>());
  });

  test('Computed5 is sync configuration', () {
    final scope = Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
      }),
      Computed5<String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        compute: (scope, it1, it2, it3, it4, it5) {
          return '$it1|$it2|$it3|$it4|$it5';
        },
      ),
    ]);

    expect(scope, isA<Scope>());
  });

  test('Computed6 is sync configuration', () {
    final scope = Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
      }),
      Computed6<String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        compute: (scope, it1, it2, it3, it4, it5, it6) {
          return '$it1|$it2|$it3|$it4|$it5|$it6';
        },
      ),
    ]);

    expect(scope, isA<Scope>());
  });

  test('Computed7 is sync configuration', () {
    final scope = Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
        final states7 = statesJust('7a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
      }),
      Computed7<String, String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7) {
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7';
        },
      ),
    ]);

    expect(scope, isA<Scope>());
  });

  test('Computed8 is sync configuration', () {
    final scope = Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
        final states7 = statesJust('7a');
        final states8 = statesJust('8a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
      }),
      Computed8<String, String, String, String, String, String, String, String,
          String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8) {
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8';
        },
      ),
    ]);

    expect(scope, isA<Scope>());
  });

  test('Computed9 is sync configuration', () {
    final scope = Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
        final states7 = statesJust('7a');
        final states8 = statesJust('8a');
        final states9 = statesJust('9a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
        scope.expose<States<String>>(
          name: 'states9',
          expose: () => states9,
        );
      }),
      Computed9<String, String, String, String, String, String, String, String,
          String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        statesName9: 'states9',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8, it9) {
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9';
        },
      ),
    ]);

    expect(scope, isA<Scope>());
  });

  test('Computed2 share same instance in scope with name', () async {
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
      ),
    ]);

    final computed1 = scope.get<States<String>>(name: 'computed');
    final computed2 = scope.get<States<String>>(name: 'computed');
    final isIdentical = identical(computed1, computed2);
    expect(isIdentical, true);
  });

  test('Computed3 share same instance in scope with name', () async {
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
      ),
    ]);

    final computed1 = scope.get<States<String>>(name: 'computed');
    final computed2 = scope.get<States<String>>(name: 'computed');
    final isIdentical = identical(computed1, computed2);
    expect(isIdentical, true);
  });

  test('Computed4 share same instance in scope with name', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
      }),
      Computed4<String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        compute: (scope, it1, it2, it3, it4) {
          return '$it1|$it2|$it3|$it4';
        },
      ),
    ]);

    final computed1 = scope.get<States<String>>(name: 'computed');
    final computed2 = scope.get<States<String>>(name: 'computed');
    final isIdentical = identical(computed1, computed2);
    expect(isIdentical, true);
  });

  test('Computed5 share same instance in scope with name', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
      }),
      Computed5<String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        compute: (scope, it1, it2, it3, it4, it5) {
          return '$it1|$it2|$it3|$it4|$it5';
        },
      ),
    ]);

    final computed1 = scope.get<States<String>>(name: 'computed');
    final computed2 = scope.get<States<String>>(name: 'computed');
    final isIdentical = identical(computed1, computed2);
    expect(isIdentical, true);
  });

  test('Computed6 share same instance in scope with name', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
      }),
      Computed6<String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        compute: (scope, it1, it2, it3, it4, it5, it6) {
          return '$it1|$it2|$it3|$it4|$it5|$it6';
        },
      ),
    ]);

    final computed1 = scope.get<States<String>>(name: 'computed');
    final computed2 = scope.get<States<String>>(name: 'computed');
    final isIdentical = identical(computed1, computed2);
    expect(isIdentical, true);
  });

  test('Computed7 share same instance in scope with name', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
        final states7 = statesJust('7a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
      }),
      Computed7<String, String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7) {
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7';
        },
      ),
    ]);

    final computed1 = scope.get<States<String>>(name: 'computed');
    final computed2 = scope.get<States<String>>(name: 'computed');
    final isIdentical = identical(computed1, computed2);
    expect(isIdentical, true);
  });

  test('Computed8 share same instance in scope with name', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
        final states7 = statesJust('7a');
        final states8 = statesJust('8a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
      }),
      Computed8<String, String, String, String, String, String, String, String,
          String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8) {
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8';
        },
      ),
    ]);

    final computed1 = scope.get<States<String>>(name: 'computed');
    final computed2 = scope.get<States<String>>(name: 'computed');
    final isIdentical = identical(computed1, computed2);
    expect(isIdentical, true);
  });

  test('Computed9 share same instance in scope with name', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
        final states7 = statesJust('7a');
        final states8 = statesJust('8a');
        final states9 = statesJust('9a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
        scope.expose<States<String>>(
          name: 'states9',
          expose: () => states9,
        );
      }),
      Computed9<String, String, String, String, String, String, String, String,
          String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        statesName9: 'states9',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8, it9) {
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9';
        },
      ),
    ]);

    final computed1 = scope.get<States<String>>(name: 'computed');
    final computed2 = scope.get<States<String>>(name: 'computed');
    final isIdentical = identical(computed1, computed2);
    expect(isIdentical, true);
  });

  test('Computed2 emit latest combined value when a source emit', () async {
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

  test('Computed3 emit latest combined value when a source emit', () async {
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

  test('Computed4 emit latest combined value when a source emit', () async {
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          Future(() => setState('4b'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
      }),
      Computed4<String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        compute: (scope, it1, it2, it3, it4) {
          return '$it1|$it2|$it3|$it4';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a', '1a|2a|3a|4b']);

    tester.stopObserve();
  });

  test('Computed5 emit latest combined value when a source emit', () async {
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          Future(() => setState('5b'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
      }),
      Computed5<String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        compute: (scope, it1, it2, it3, it4, it5) {
          return '$it1|$it2|$it3|$it4|$it5';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a', '1a|2a|3a|4a|5b']);

    tester.stopObserve();
  });

  test('Computed6 emit latest combined value when a source emit', () async {
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          return Disposable.empty;
        });
        final states6 = States<String>((setState) {
          setState('6a');
          Future(() => setState('6b'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
      }),
      Computed6<String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        compute: (scope, it1, it2, it3, it4, it5, it6) {
          return '$it1|$it2|$it3|$it4|$it5|$it6';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a', '1a|2a|3a|4a|5a|6b']);

    tester.stopObserve();
  });

  test('Computed7 emit latest combined value when a source emit', () async {
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          return Disposable.empty;
        });
        final states6 = States<String>((setState) {
          setState('6a');
          return Disposable.empty;
        });
        final states7 = States<String>((setState) {
          setState('7a');
          Future(() => setState('7b'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
      }),
      Computed7<String, String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7) {
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a', '1a|2a|3a|4a|5a|6a|7b']);

    tester.stopObserve();
  });

  test('Computed8 emit latest combined value when a source emit', () async {
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          return Disposable.empty;
        });
        final states6 = States<String>((setState) {
          setState('6a');
          return Disposable.empty;
        });
        final states7 = States<String>((setState) {
          setState('7a');
          return Disposable.empty;
        });
        final states8 = States<String>((setState) {
          setState('8a');
          Future(() => setState('8b'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
      }),
      Computed8<String, String, String, String, String, String, String, String,
          String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8) {
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a|8a', '1a|2a|3a|4a|5a|6a|7a|8b']);

    tester.stopObserve();
  });

  test('Computed9 emit latest combined value when a source emit', () async {
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          return Disposable.empty;
        });
        final states6 = States<String>((setState) {
          setState('6a');
          return Disposable.empty;
        });
        final states7 = States<String>((setState) {
          setState('7a');
          return Disposable.empty;
        });
        final states8 = States<String>((setState) {
          setState('8a');
          return Disposable.empty;
        });
        final states9 = States<String>((setState) {
          setState('9a');
          Future(() => setState('9b'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
        scope.expose<States<String>>(
          name: 'states9',
          expose: () => states9,
        );
      }),
      Computed9<String, String, String, String, String, String, String, String,
          String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        statesName9: 'states9',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8, it9) {
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a', '1a|2a|3a|4a|5a|6a|7a|8a|9b']);

    tester.stopObserve();
  });

  test('Computed2 compute with other scope value', () async {
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
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final first = computed.first;
    expect(first, '0|1a|2a');
  });

  test('Computed3 compute with other scope value', () async {
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
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final first = computed.first;
    expect(first, '0|1a|2a|3a');
  });

  test('Computed4 compute with other scope value', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<int>(expose: () => 0);
      }),
      Computed4<String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        compute: (scope, it1, it2, it3, it4) {
          final value = scope.get<int>();
          return '$value|$it1|$it2|$it3|$it4';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final first = computed.first;
    expect(first, '0|1a|2a|3a|4a');
  });

  test('Computed5 compute with other scope value', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<int>(expose: () => 0);
      }),
      Computed5<String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        compute: (scope, it1, it2, it3, it4, it5) {
          final value = scope.get<int>();
          return '$value|$it1|$it2|$it3|$it4|$it5';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final first = computed.first;
    expect(first, '0|1a|2a|3a|4a|5a');
  });

  test('Computed6 compute with other scope value', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<int>(expose: () => 0);
      }),
      Computed6<String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        compute: (scope, it1, it2, it3, it4, it5, it6) {
          final value = scope.get<int>();
          return '$value|$it1|$it2|$it3|$it4|$it5|$it6';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final first = computed.first;
    expect(first, '0|1a|2a|3a|4a|5a|6a');
  });

  test('Computed7 compute with other scope value', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
        final states7 = statesJust('7a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<int>(expose: () => 0);
      }),
      Computed7<String, String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7) {
          final value = scope.get<int>();
          return '$value|$it1|$it2|$it3|$it4|$it5|$it6|$it7';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final first = computed.first;
    expect(first, '0|1a|2a|3a|4a|5a|6a|7a');
  });

  test('Computed8 compute with other scope value', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
        final states7 = statesJust('7a');
        final states8 = statesJust('8a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
        scope.expose<int>(expose: () => 0);
      }),
      Computed8<String, String, String, String, String, String, String, String,
          String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8) {
          final value = scope.get<int>();
          return '$value|$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final first = computed.first;
    expect(first, '0|1a|2a|3a|4a|5a|6a|7a|8a');
  });

  test('Computed9 compute with other scope value', () async {
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
        final states7 = statesJust('7a');
        final states8 = statesJust('8a');
        final states9 = statesJust('9a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
        scope.expose<States<String>>(
          name: 'states9',
          expose: () => states9,
        );
        scope.expose<int>(expose: () => 0);
      }),
      Computed9<String, String, String, String, String, String, String, String,
          String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        statesName9: 'states9',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8, it9) {
          final value = scope.get<int>();
          return '$value|$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final first = computed.first;
    expect(first, '0|1a|2a|3a|4a|5a|6a|7a|8a|9a');
  });

  test("Computed2 exposed States won't forward data after scope disposed",
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

  test("Computed3 exposed States won't forward data after scope disposed",
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

  test("Computed4 exposed States won't forward data after scope disposed",
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          Future(() => setState('4b'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
      }),
      Computed4<String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        compute: (scope, it1, it2, it3, it4) {
          return '$it1|$it2|$it3|$it4';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    scope.dispose();

    expect(tester.recorded, <String>['1a|2a|3a|4a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a']);

    tester.stopObserve();
  });

  test("Computed5 exposed States won't forward data after scope disposed",
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          Future(() => setState('5b'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
      }),
      Computed5<String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        compute: (scope, it1, it2, it3, it4, it5) {
          return '$it1|$it2|$it3|$it4|$it5';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    scope.dispose();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a']);

    tester.stopObserve();
  });

  test("Computed6 exposed States won't forward data after scope disposed",
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          return Disposable.empty;
        });
        final states6 = States<String>((setState) {
          setState('6a');
          Future(() => setState('6b'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
      }),
      Computed6<String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        compute: (scope, it1, it2, it3, it4, it5, it6) {
          return '$it1|$it2|$it3|$it4|$it5|$it6';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    scope.dispose();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a']);

    tester.stopObserve();
  });

  test("Computed7 exposed States won't forward data after scope disposed",
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          return Disposable.empty;
        });
        final states6 = States<String>((setState) {
          setState('6a');
          return Disposable.empty;
        });
        final states7 = States<String>((setState) {
          setState('7a');
          Future(() => setState('7b'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
      }),
      Computed7<String, String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7) {
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    scope.dispose();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a']);

    tester.stopObserve();
  });

  test("Computed8 exposed States won't forward data after scope disposed",
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          return Disposable.empty;
        });
        final states6 = States<String>((setState) {
          setState('6a');
          return Disposable.empty;
        });
        final states7 = States<String>((setState) {
          setState('7a');
          return Disposable.empty;
        });
        final states8 = States<String>((setState) {
          setState('8a');
          Future(() => setState('8b'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
      }),
      Computed8<String, String, String, String, String, String, String, String,
          String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8) {
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    scope.dispose();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a']);

    tester.stopObserve();
  });

  test("Computed9 exposed States won't forward data after scope disposed",
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          return Disposable.empty;
        });
        final states6 = States<String>((setState) {
          setState('6a');
          return Disposable.empty;
        });
        final states7 = States<String>((setState) {
          setState('7a');
          return Disposable.empty;
        });
        final states8 = States<String>((setState) {
          setState('8a');
          return Disposable.empty;
        });
        final states9 = States<String>((setState) {
          setState('9a');
          Future(() => setState('9b'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
        scope.expose<States<String>>(
          name: 'states9',
          expose: () => states9,
        );
      }),
      Computed9<String, String, String, String, String, String, String, String,
          String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        statesName9: 'states9',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8, it9) {
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    scope.dispose();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a']);

    tester.stopObserve();
  });

  test('Computed2 default equals', () async {
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

  test('Computed3 default equals', () async {
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

  test('Computed4 default equals', () async {
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          Future(() => setState('4a'));
          Future(() => setState('4b'));
          Future(() => setState('4b'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
      }),
      Computed4<String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        compute: (scope, it1, it2, it3, it4) {
          return '$it1|$it2|$it3|$it4';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a', '1a|2a|3a|4b']);

    tester.stopObserve();
  });

  test('Computed5 default equals', () async {
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          Future(() => setState('5a'));
          Future(() => setState('5b'));
          Future(() => setState('5b'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
      }),
      Computed5<String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        compute: (scope, it1, it2, it3, it4, it5) {
          return '$it1|$it2|$it3|$it4|$it5';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a', '1a|2a|3a|4a|5b']);

    tester.stopObserve();
  });

  test('Computed6 default equals', () async {
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          return Disposable.empty;
        });
        final states6 = States<String>((setState) {
          setState('6a');
          Future(() => setState('6a'));
          Future(() => setState('6b'));
          Future(() => setState('6b'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
      }),
      Computed6<String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        compute: (scope, it1, it2, it3, it4, it5, it6) {
          return '$it1|$it2|$it3|$it4|$it5|$it6';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a', '1a|2a|3a|4a|5a|6b']);

    tester.stopObserve();
  });

  test('Computed7 default equals', () async {
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          return Disposable.empty;
        });
        final states6 = States<String>((setState) {
          setState('6a');
          return Disposable.empty;
        });
        final states7 = States<String>((setState) {
          setState('7a');
          Future(() => setState('7a'));
          Future(() => setState('7b'));
          Future(() => setState('7b'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
      }),
      Computed7<String, String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7) {
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a', '1a|2a|3a|4a|5a|6a|7b']);

    tester.stopObserve();
  });

  test('Computed8 default equals', () async {
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          return Disposable.empty;
        });
        final states6 = States<String>((setState) {
          setState('6a');
          return Disposable.empty;
        });
        final states7 = States<String>((setState) {
          setState('7a');
          return Disposable.empty;
        });
        final states8 = States<String>((setState) {
          setState('8a');
          Future(() => setState('8a'));
          Future(() => setState('8b'));
          Future(() => setState('8b'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
      }),
      Computed8<String, String, String, String, String, String, String, String,
          String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8) {
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a|8a', '1a|2a|3a|4a|5a|6a|7a|8b']);

    tester.stopObserve();
  });

  test('Computed9 default equals', () async {
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          return Disposable.empty;
        });
        final states6 = States<String>((setState) {
          setState('6a');
          return Disposable.empty;
        });
        final states7 = States<String>((setState) {
          setState('7a');
          return Disposable.empty;
        });
        final states8 = States<String>((setState) {
          setState('8a');
          return Disposable.empty;
        });
        final states9 = States<String>((setState) {
          setState('9a');
          Future(() => setState('9a'));
          Future(() => setState('9b'));
          Future(() => setState('9b'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
        scope.expose<States<String>>(
          name: 'states9',
          expose: () => states9,
        );
      }),
      Computed9<String, String, String, String, String, String, String, String,
          String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        statesName9: 'states9',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8, it9) {
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9';
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a', '1a|2a|3a|4a|5a|6a|7a|8a|9b']);

    tester.stopObserve();
  });

  test('Computed2 custom equals', () async {
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

  test('Computed3 custom equals', () async {
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

  test('Computed4 custom equals', () async {
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          Future(() => setState('4b'));
          Future(() => setState('4aa'));
          Future(() => setState('4bb'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
      }),
      Computed4<String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        compute: (scope, it1, it2, it3, it4) {
          return '$it1|$it2|$it3|$it4';
        },
        equals: (it1, it2) {
          return it1.length == it2.length;
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a', '1a|2a|3a|4aa']);

    tester.stopObserve();
  });

  test('Computed5 custom equals', () async {
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          Future(() => setState('5b'));
          Future(() => setState('5aa'));
          Future(() => setState('5bb'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
      }),
      Computed5<String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        compute: (scope, it1, it2, it3, it4, it5) {
          return '$it1|$it2|$it3|$it4|$it5';
        },
        equals: (it1, it2) {
          return it1.length == it2.length;
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a']);

    await Future(() {});

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a', '1a|2a|3a|4a|5aa']);

    tester.stopObserve();
  });

  test('Computed6 custom equals', () async {
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          return Disposable.empty;
        });
        final states6 = States<String>((setState) {
          setState('6a');
          Future(() => setState('6b'));
          Future(() => setState('6aa'));
          Future(() => setState('6bb'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
      }),
      Computed6<String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        compute: (scope, it1, it2, it3, it4, it5, it6) {
          return '$it1|$it2|$it3|$it4|$it5|$it6';
        },
        equals: (it1, it2) {
          return it1.length == it2.length;
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a']);

    await Future(() {});

    expect(
        tester.recorded, <String>['1a|2a|3a|4a|5a|6a', '1a|2a|3a|4a|5a|6aa']);

    tester.stopObserve();
  });

  test('Computed7 custom equals', () async {
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          return Disposable.empty;
        });
        final states6 = States<String>((setState) {
          setState('6a');
          return Disposable.empty;
        });
        final states7 = States<String>((setState) {
          setState('7a');
          Future(() => setState('7b'));
          Future(() => setState('7aa'));
          Future(() => setState('7bb'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
      }),
      Computed7<String, String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7) {
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7';
        },
        equals: (it1, it2) {
          return it1.length == it2.length;
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a', '1a|2a|3a|4a|5a|6a|7aa']);

    tester.stopObserve();
  });

  test('Computed8 custom equals', () async {
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          return Disposable.empty;
        });
        final states6 = States<String>((setState) {
          setState('6a');
          return Disposable.empty;
        });
        final states7 = States<String>((setState) {
          setState('7a');
          return Disposable.empty;
        });
        final states8 = States<String>((setState) {
          setState('8a');
          Future(() => setState('8b'));
          Future(() => setState('8aa'));
          Future(() => setState('8bb'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
      }),
      Computed8<String, String, String, String, String, String, String, String,
          String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8) {
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8';
        },
        equals: (it1, it2) {
          return it1.length == it2.length;
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a|8a', '1a|2a|3a|4a|5a|6a|7a|8aa']);

    tester.stopObserve();
  });

  test('Computed9 custom equals', () async {
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
          return Disposable.empty;
        });
        final states4 = States<String>((setState) {
          setState('4a');
          return Disposable.empty;
        });
        final states5 = States<String>((setState) {
          setState('5a');
          return Disposable.empty;
        });
        final states6 = States<String>((setState) {
          setState('6a');
          return Disposable.empty;
        });
        final states7 = States<String>((setState) {
          setState('7a');
          return Disposable.empty;
        });
        final states8 = States<String>((setState) {
          setState('8a');
          return Disposable.empty;
        });
        final states9 = States<String>((setState) {
          setState('9a');
          Future(() => setState('9b'));
          Future(() => setState('9aa'));
          Future(() => setState('9bb'));
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
        scope.expose<States<String>>(
          name: 'states9',
          expose: () => states9,
        );
      }),
      Computed9<String, String, String, String, String, String, String, String,
          String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        statesName9: 'states9',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8, it9) {
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9';
        },
        equals: (it1, it2) {
          return it1.length == it2.length;
        },
      ),
    ]);

    final computed = scope.get<States<String>>(name: 'computed');
    final tester = StatesTester(
      computed,
    );

    tester.startObserve();

    expect(tester.recorded, <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a']);

    await Future(() {});

    expect(tester.recorded,
        <String>['1a|2a|3a|4a|5a|6a|7a|8a|9a', '1a|2a|3a|4a|5a|6a|7a|8a|9aa']);

    tester.stopObserve();
  });

  test('Computed2 compute lazily when lazy is omitted', () async {
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
        lazy: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);
  });

  test('Computed3 compute lazily when lazy is omitted', () async {
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
        lazy: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);
  });

  test('Computed4 compute lazily when lazy is omitted', () async {
    int invokes = 0;
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
      }),
      Computed4<String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        compute: (scope, it1, it2, it3, it4) {
          invokes += 1;
          return '$it1|$it2|$it3|$it4';
        },
        lazy: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);
  });

  test('Computed5 compute lazily when lazy is omitted', () async {
    int invokes = 0;
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
      }),
      Computed5<String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        compute: (scope, it1, it2, it3, it4, it5) {
          invokes += 1;
          return '$it1|$it2|$it3|$it4|$it5';
        },
        lazy: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);
  });

  test('Computed6 compute lazily when lazy is omitted', () async {
    int invokes = 0;
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
      }),
      Computed6<String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        compute: (scope, it1, it2, it3, it4, it5, it6) {
          invokes += 1;
          return '$it1|$it2|$it3|$it4|$it5|$it6';
        },
        lazy: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);
  });

  test('Computed7 compute lazily when lazy is omitted', () async {
    int invokes = 0;
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
        final states7 = statesJust('7a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
      }),
      Computed7<String, String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7) {
          invokes += 1;
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7';
        },
        lazy: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);
  });

  test('Computed8 compute lazily when lazy is omitted', () async {
    int invokes = 0;
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
        final states7 = statesJust('7a');
        final states8 = statesJust('8a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
      }),
      Computed8<String, String, String, String, String, String, String, String,
          String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8) {
          invokes += 1;
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8';
        },
        lazy: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);
  });

  test('Computed9 compute lazily when lazy is omitted', () async {
    int invokes = 0;
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
        final states7 = statesJust('7a');
        final states8 = statesJust('8a');
        final states9 = statesJust('9a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
        scope.expose<States<String>>(
          name: 'states9',
          expose: () => states9,
        );
      }),
      Computed9<String, String, String, String, String, String, String, String,
          String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        statesName9: 'states9',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8, it9) {
          invokes += 1;
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9';
        },
        lazy: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);
  });

  test('Computed2 compute lazily when lazy is true', () async {
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
        lazy: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);
  });

  test('Computed3 compute lazily when lazy is true', () async {
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
        lazy: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);
  });

  test('Computed4 compute lazily when lazy is true', () async {
    int invokes = 0;
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
      }),
      Computed4<String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        compute: (scope, it1, it2, it3, it4) {
          invokes += 1;
          return '$it1|$it2|$it3|$it4';
        },
        lazy: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);
  });

  test('Computed5 compute lazily when lazy is true', () async {
    int invokes = 0;
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
      }),
      Computed5<String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        compute: (scope, it1, it2, it3, it4, it5) {
          invokes += 1;
          return '$it1|$it2|$it3|$it4|$it5';
        },
        lazy: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);
  });

  test('Computed6 compute lazily when lazy is true', () async {
    int invokes = 0;
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
      }),
      Computed6<String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        compute: (scope, it1, it2, it3, it4, it5, it6) {
          invokes += 1;
          return '$it1|$it2|$it3|$it4|$it5|$it6';
        },
        lazy: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);
  });

  test('Computed7 compute lazily when lazy is true', () async {
    int invokes = 0;
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
        final states7 = statesJust('7a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
      }),
      Computed7<String, String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7) {
          invokes += 1;
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7';
        },
        lazy: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);
  });

  test('Computed8 compute lazily when lazy is true', () async {
    int invokes = 0;
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
        final states7 = statesJust('7a');
        final states8 = statesJust('8a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
      }),
      Computed8<String, String, String, String, String, String, String, String,
          String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8) {
          invokes += 1;
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8';
        },
        lazy: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);
  });

  test('Computed9 compute lazily when lazy is true', () async {
    int invokes = 0;
    final scope = await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
        final states7 = statesJust('7a');
        final states8 = statesJust('8a');
        final states9 = statesJust('9a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
        scope.expose<States<String>>(
          name: 'states9',
          expose: () => states9,
        );
      }),
      Computed9<String, String, String, String, String, String, String, String,
          String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        statesName9: 'states9',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8, it9) {
          invokes += 1;
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9';
        },
        lazy: true,
      ),
    ]);

    expect(invokes, 0);
    scope.get<States<String>>(name: 'computed');
    expect(invokes, 1);
  });

  test('Computed2 compute immediately when lazy is false', () async {
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
        lazy: false,
      ),
    ]);

    expect(invokes, 1);
  });

  test('Computed3 compute immediately when lazy is false', () async {
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
        lazy: false,
      ),
    ]);

    expect(invokes, 1);
  });

  test('Computed4 compute immediately when lazy is false', () async {
    int invokes = 0;
    await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
      }),
      Computed4<String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        compute: (scope, it1, it2, it3, it4) {
          invokes += 1;
          return '$it1|$it2|$it3|$it4';
        },
        lazy: false,
      ),
    ]);

    expect(invokes, 1);
  });

  test('Computed5 compute immediately when lazy is false', () async {
    int invokes = 0;
    await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
      }),
      Computed5<String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        compute: (scope, it1, it2, it3, it4, it5) {
          invokes += 1;
          return '$it1|$it2|$it3|$it4|$it5';
        },
        lazy: false,
      ),
    ]);

    expect(invokes, 1);
  });

  test('Computed6 compute immediately when lazy is false', () async {
    int invokes = 0;
    await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
      }),
      Computed6<String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        compute: (scope, it1, it2, it3, it4, it5, it6) {
          invokes += 1;
          return '$it1|$it2|$it3|$it4|$it5|$it6';
        },
        lazy: false,
      ),
    ]);

    expect(invokes, 1);
  });

  test('Computed7 compute immediately when lazy is false', () async {
    int invokes = 0;
    await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
        final states7 = statesJust('7a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
      }),
      Computed7<String, String, String, String, String, String, String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7) {
          invokes += 1;
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7';
        },
        lazy: false,
      ),
    ]);

    expect(invokes, 1);
  });

  test('Computed8 compute immediately when lazy is false', () async {
    int invokes = 0;
    await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
        final states7 = statesJust('7a');
        final states8 = statesJust('8a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
      }),
      Computed8<String, String, String, String, String, String, String, String,
          String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8) {
          invokes += 1;
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8';
        },
        lazy: false,
      ),
    ]);

    expect(invokes, 1);
  });

  test('Computed9 compute immediately when lazy is false', () async {
    int invokes = 0;
    await Scope.root([
      MockConfigurable((scope) {
        final states1 = statesJust('1a');
        final states2 = statesJust('2a');
        final states3 = statesJust('3a');
        final states4 = statesJust('4a');
        final states5 = statesJust('5a');
        final states6 = statesJust('6a');
        final states7 = statesJust('7a');
        final states8 = statesJust('8a');
        final states9 = statesJust('9a');
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
        scope.expose<States<String>>(
          name: 'states4',
          expose: () => states4,
        );
        scope.expose<States<String>>(
          name: 'states5',
          expose: () => states5,
        );
        scope.expose<States<String>>(
          name: 'states6',
          expose: () => states6,
        );
        scope.expose<States<String>>(
          name: 'states7',
          expose: () => states7,
        );
        scope.expose<States<String>>(
          name: 'states8',
          expose: () => states8,
        );
        scope.expose<States<String>>(
          name: 'states9',
          expose: () => states9,
        );
      }),
      Computed9<String, String, String, String, String, String, String, String,
          String, String>(
        name: 'computed',
        statesName1: 'states1',
        statesName2: 'states2',
        statesName3: 'states3',
        statesName4: 'states4',
        statesName5: 'states5',
        statesName6: 'states6',
        statesName7: 'states7',
        statesName8: 'states8',
        statesName9: 'states9',
        compute: (scope, it1, it2, it3, it4, it5, it6, it7, it8, it9) {
          invokes += 1;
          return '$it1|$it2|$it3|$it4|$it5|$it6|$it7|$it8|$it9';
        },
        lazy: false,
      ),
    ]);

    expect(invokes, 1);
  });
}
