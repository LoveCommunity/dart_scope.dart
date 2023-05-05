
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testCustomEquals(int? number) {
  final n = number!;
  return '''
    test('Computed$number custom equals', () async {
      ${code([
        _scopeRoot(n),
        getComputed(),
        statesTester(),
        testerStartObserve(),
        expectTesterRecorded<String>(expectsAllA(n)),
        awaitEmptyFuture(),
        expectTesterRecorded<String>(_expects2(n)),
        testerStopObserve(),
      ])}
    });
  ''';
}

String _scopeRoot(int n) {
  return scopeRoot(
    configure: [
      mockConfigurable(
        body: [
          ...statesIterable(n, _states),
          ...scopeExposeStatesIterable(n),
        ].join(''),
      ),
      computed(
        n: n,
        equalsBody: 'return it1.length == it2.length;',
      ),
    ],
  );
}

String _states(bool isLast, int n) {
  return '''
    final states$n = States<String>((setState) {
      ${code([
        "setState('${n}a');",
        if (isLast) ...[
          "Future(() => setState('${n}b'));",
          "Future(() => setState('${n}aa'));",
          "Future(() => setState('${n}bb'));",
        ],
      ])}
      return Disposable.empty;
    });
  ''';
}

List<String> _expects2(int count) {
  bool isLast(int n) => n == count;
  return [
    joinAllA(count), // '1a|2a'
    join(                                     // '1a|2aa'
      count,
      (n) => '$n${!isLast(n) ? 'a' : 'aa'}',
      '|'
    ).boxed()
  ];
}

