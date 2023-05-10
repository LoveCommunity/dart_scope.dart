
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testStatesComputedDefaultEquals(int? number) {
  final n = number ?? 2;
  return '''
    test('${statesComputedTestHeader(number)} default equals', () async {
      ${code([
        ...statesIterable(n, _states),
        statesComputed(number),
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