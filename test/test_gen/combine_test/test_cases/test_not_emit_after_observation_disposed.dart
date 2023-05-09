
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testObservableCombineNotEmitAfterObservationDispose(int? number) {
  final count = number ?? 2;
  return '''
    test('${observableCombineTestHeader(number)} will not emit data after observation disposed', () async {
      ${code([
        ...observables(count, sampleObservable),
        observableCombine(number),
        observableTester(),
        testerStartObserve(),
        testerStopObserve(),
        expectTesterRecorded<String>(expectsAllA(count)),
        awaitEmptyFuture(),
        expectTesterRecorded<String>(expectsAllA(count)),
      ])}
    });
  ''';
}

String testStatesComputedNotEmitAfterObservationDispose(int? number) {
  final count = number ?? 2;
  return '''
    test('${statesComputedTestHeader(number)} will not emit data after observation disposed', () async {
      ${code([
        ...statesIterable(count, sampleStates),
        statesComputed(number),
        statesTester(),
        testerStartObserve(),
        testerStopObserve(),
        expectTesterRecorded<String>(expectsAllA(count)),
        awaitEmptyFuture(),
        expectTesterRecorded<String>(expectsAllA(count)),
      ])}
    });
  ''';
}
