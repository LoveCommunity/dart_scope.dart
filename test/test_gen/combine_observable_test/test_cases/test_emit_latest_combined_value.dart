
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testEmitLatestCombinedValue(int? number) {
  final isList = number == null;
  final count = number ?? 2;
  return '''
    test('combine observable${isList ? '' : '$number'} emit latest combined value when a child emit', () async {
      ${observables(isList, count, _observable)}
      ${combineObservable(number)}
      ${combineObservableTester()}
      ${testerStartObserve()}
      ${expectTesterRecorded(_expects1(count))}
      ${awaitEmptyFuture()}
      ${expectTesterRecorded(_expects2(count))}
      ${testerStopObserve()}
    });
  ''';
}

String _observable(bool isList, bool isLast, int n) {
  return '''
    final observable$n = Observable<${isList ? 'Object?' : 'String'}>((onData) {
       ${[
        "onData('${n}a');",
        if (isLast) "Future(() => onData('${n}b'));"
       ].join('\n')}
      return Disposable.empty;
    });
  ''';
}

List<String> _expects1(int count) {
  return [
    join(count, (n) => '${n}a', '|').boxed(), // '1a|2a'
  ];
}

List<String> _expects2(int count) {
  return [
    join(count, (n) => '${n}a', '|').boxed(), // '1a|2a'
    join(                                     // '1a|2b'
      count,
      (n) => '${n}${n != count ? 'a' : 'b'}',
      '|'
    ).boxed()
  ];
}