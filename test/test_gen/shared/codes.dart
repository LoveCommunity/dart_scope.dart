
String testAll({
  required List<String Function(int?)> tests,
  required List<int?> numbers,
}) {
  final allTests = tests
    .expand((test) => numbers.map(test))
    .join('\n');
  return 'void _main() {$allTests}';
}

Iterable<String> observables(
  int count, 
  String Function(bool isLast, int n) observable
) {
  return generateN(
    count,
    (n) => observable(n == count, n),
  );
}

Iterable<String> statesIterable(
  int count,
  String Function(bool isLast, int n) states
) {
  return generateN(
    count,
    (n) => states(n == count, n),
  );
}

Iterable<String> sampleObservables(int count) {
  return observables(count, sampleObservable);
}

Iterable<String> sampleStatesIterable(int count) {
  return statesIterable(count, sampleStates);
}

String sampleObservable(bool isLast, int n) {
  return '''
    final observable$n = Observable<String>((onData) {
       ${[
        "onData('${n}a');",
        if (isLast) "Future(() => onData('${n}b'));"
       ].join('\n')}
      return Disposable.empty;
    });
  ''';
}

String sampleStates(bool isLast, int n) {
  return '''
    final states$n = States<String>((setState) {
       ${[
        "setState('${n}a');",
        if (isLast) "Future(() => setState('${n}b'));"
       ].join('\n')}
      return Disposable.empty;
    });
  ''';
}

String assignObservableTester(String name) {
  return '''
    final tester = ObservableTester(
      $name,
    );
  ''';
}

String assignStatesTester(String name) {
  return '''
    final tester = StatesTester(
      $name,
    );
  ''';
}

String testerStartObserve() {
  return'''
    tester.startObserve();
  ''';
}

String testerStopObserve() {
  return '''
    tester.stopObserve();
  ''';
}

String intInvokes() => 'int invokes = 0;';

String expectTesterRecorded<T>(List<String> expects) {
  return expectList<T>('tester.recorded', expects);
}

String expectInvokes(int n) => 'expect(invokes, $n);';

String expectInvokesList<T>(List<String> expects) {
  return expectList<T>('invokes', expects);
}

String expectList<T>(String name, List<String> expects) {
  return '''
    expect($name, <$T>[
      ${expects.join(',\n')}
    ]);
  '''; 
}

List<String> expectAllA(int count) {
  return [
    joinAllA(count), // '1a|2a'
  ];
}

List<String> expectAB(int count) {
  bool isLast(int n) => n == count;
  return [
    joinAllA(count), // '1a|2a'
    join(                                     // '1a|2b'
      count,
      (n) => '$n${!isLast(n) ? 'a' : 'b'}',
      '|'
    ).boxed()
  ];
}

/// '1a|2a'
String joinAllA(int count) {
  return join(
    count, 
    (n) => '${n}a', 
    '|'
  ).boxed(); 
}

String awaitEmptyFuture() {
  return '''
    await Future(() {});
  ''';
}

String join(int count, String Function(int) compute, [String joiner = '']) {
  return generateN(count, compute).join(joiner);
}

Iterable<T> generateN<T>(int count, T Function(int) compute) {
  return Iterable<T>.generate(count, (i) => compute(i +1));
}

extension BoxedX on String {

  String boxed([String char="'"]) => char + this + char;
}

String scopeRoot({
  bool assign = true,
  bool awaiting = true,
  required List<String> configure,
}) {
  final maybeScope = assign ? 'final scope = ' : '';
  final maybeAwait = awaiting ? 'await ' : '';
  return '''
    $maybeScope${maybeAwait}Scope.root([
      ${configure
        .map((it) => '$it,\n')
        .join('')
      }
    ]);
  ''';
}

String mockConfigurable({
  bool async = false,
  required String body,
}) {
  final maybeAsync = async ? 'async ' : '';
  return '''
    MockConfigurable((scope) $maybeAsync{
      $body
    })
  ''';
}

String scopeDispose() => '''
  scope.dispose();
''';

