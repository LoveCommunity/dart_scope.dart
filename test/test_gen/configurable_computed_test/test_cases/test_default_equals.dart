
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testDefaultEquals(int? number) {
  final n = number!;
  return '''
    test('`Computed$number` default equals', () async {
      ${code([
        _scopeRoot(n),
        getComputed(),
        statesTester(),
        testerStartObserve(),
        expectTesterRecorded<String>(expectsAllA(n)),
        awaitEmptyFuture(),
        expectTesterRecorded<String>(expectsAB(n)),
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
          "Future(() => setState('${n}a'));",
          "Future(() => setState('${n}b'));",
          "Future(() => setState('${n}b'));",
        ],
      ])}
      return Disposable.empty;
    });
  ''';
}
