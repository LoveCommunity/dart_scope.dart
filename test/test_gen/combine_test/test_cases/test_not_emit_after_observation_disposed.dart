
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
        expectTesterRecorded(_expects(count)),
        awaitEmptyFuture(),
        expectTesterRecorded(_expects(count)),
      ].join('\n')}
    });
  ''';
}

List<String> _expects(int count) {
  return [
    joinAllA(count),
  ];
}

String testDriverCombineNotEmitAfterObservationDispose(int? number) {
  final count = number ?? 2;
  return '''
    test('${driverCombineTestHeader(number)} will not emit data after observation disposed', () async {
      ${[
        ...drivers(count, sampleDriver),
        driverCombine(number),
        driverTester(),
        testerStartDrive(),
        testerStopDrive(),
        expectTesterRecorded(_expects(count)),
        awaitEmptyFuture(),
        expectTesterRecorded(_expects(count)),
      ].join('\n')}
    });
  ''';
}
