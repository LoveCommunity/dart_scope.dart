
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testObservableCombineEmitIfAllChildrenEmitted(int? number) {
  final isList = number == null;
  final count = number ?? 2;
  return '''
    test('${observableCombineTestHeader(number)} emit if all children emitted', () async {
      ${[
        ...observables(isList, count, _observable),
        observableCombine(number),
        observableTester(),
        testerStartObserve(),
        expectTesterRecorded([]),
        awaitEmptyFuture(),
        expectTesterRecorded(_expects(count)),
        testerStopObserve(),
      ].join('\n')}
    });
  ''';
}

String _observable(bool isList, bool isLast, int n) {
  final onData = "onData('${n}a')";
  return '''
    final observable$n = Observable<${isList ? 'Object?' : 'String'}>((onData) {
      ${!isLast
        ? "$onData;"
        : "Future(() => $onData);" 
      }
      return Disposable.empty;
    });
  ''';
}

List<String> _expects(int count) => [
  joinAllA(count), // '1a|2a'
];
