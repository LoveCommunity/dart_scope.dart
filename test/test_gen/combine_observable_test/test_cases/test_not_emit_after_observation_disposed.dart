
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testNotEmitAfterObservationDispose(int? number) {
  final isList = number == null;
  final count = number ?? 2;
  return '''
    test('combine observable${isList ? '' : '$number'} will not emit data after observation disposed', () async {
      ${[
        ...observables(isList, count, sampleObservable),
        combineObservable(number),
        combineObservableTester(),
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