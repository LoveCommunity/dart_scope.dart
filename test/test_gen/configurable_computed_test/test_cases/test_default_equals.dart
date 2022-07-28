
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testDefaultEquals(int? number) {
  final n = number!;
  return '''
    test('`Computed$number` default equals', () async {
      ${[
        _scopeRoot(n),
        getComputed(),
        statesTester(),
        testerStartObserve(),
        expectTesterRecorded<String>(expectAllA(n)),
        awaitEmptyFuture(),
        expectTesterRecorded<String>(expectAB(n)),
        testerStopObserve(),
      ].join('\n')}
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
      ${[
        "setState('${n}a');",
        if (isLast) ...[
          "Future(() => setState('${n}a'));",
          "Future(() => setState('${n}b'));",
          "Future(() => setState('${n}b'));",
        ],
      ].join('\n')}
      return Disposable.empty;
    });
  ''';
}
