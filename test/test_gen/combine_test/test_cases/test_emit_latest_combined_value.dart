
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testObservableCombineEmitLatestCombinedValue(int? number) {
  final count = number ?? 2;
  return '''
    test('${observableCombineTestHeader(number)} emit latest combined value when a source emit', () async {
      ${code([
        ...observables(count, sampleObservable),
        observableCombine(number),
        observableTester(),
        testerStartObserve(),
        expectTesterRecorded<String>(expectAllA(count)),
        awaitEmptyFuture(),
        expectTesterRecorded<String>(expectAB(count)),
        testerStopObserve(),
      ])}
    });
  ''';
}

String testStatesCombineEmitLatestCombinedValue(int? number) {
  final count = number ?? 2;
  return '''
    test('${statesCombineTestHeader(number)} emit latest combined value when a source emit', () async {
      ${code([
        ...statesIterable(count, sampleStates),
        statesCombine(number),
        statesTester(),
        testerStartObserve(),
        expectTesterRecorded<String>(expectAllA(count)),
        awaitEmptyFuture(),
        expectTesterRecorded<String>(expectAB(count)),
        testerStopObserve(),
      ])}
    });
  ''';
}
