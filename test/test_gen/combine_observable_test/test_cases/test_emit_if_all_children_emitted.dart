
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testEmitIfAllChildrenEmitted(int? number) {
  final isList = number == null;
  final count = number ?? 2;
  return '''
    test('combine observable${isList ? '' : '$number'} emit if all children emitted', () async {
      ${observables(isList, count, _observable)}
      ${combineObservable(number)}
      ${combineObservableTester()}
      ${testerStartObserve()}
      ${expectTesterRecorded([])}
      ${awaitEmptyFuture()}
      ${expectTesterRecorded(_expects(count))}
      ${testerStopObserve()}
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
  join(count, (n) => '${n}a', '|').boxed(), // '1a|2a'
];
