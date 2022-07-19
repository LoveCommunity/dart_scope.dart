
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testObservableCombineNotEmitAfterObservationDispose(int? number) {
  final count = number ?? 2;
  return '''
    test('${observableCombineTestHeader(number)} will not emit data after observation disposed', () async {
      ${[
        ...observables(count, sampleObservable),
        observableCombine(number),
        observableTester(),
        testerStartObserve(),
        testerStopObserve(),
        expectTesterRecorded<String>(_expects(count)),
        awaitEmptyFuture(),
        expectTesterRecorded<String>(_expects(count)),
      ].join('\n')}
    });
  ''';
}

List<String> _expects(int count) {
  return [
    joinAllA(count),
  ];
}

String testStatesCombineNotEmitAfterObservationDispose(int? number) {
  final count = number ?? 2;
  return '''
    test('${statesCombineTestHeader(number)} will not emit data after observation disposed', () async {
      ${[
        ...states_iterable(count, sampleStates),
        statesCombine(number),
        statesTester(),
        testerStartObserve(),
        testerStopObserve(),
        expectTesterRecorded<String>(_expects(count)),
        awaitEmptyFuture(),
        expectTesterRecorded<String>(_expects(count)),
      ].join('\n')}
    });
  ''';
}
