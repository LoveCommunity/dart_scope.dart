
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testEmitLatestCombinedValue(int? number) {
  final count = number ?? 2;
  final isList = number == null;
  return '''
    test('combine observable${isList ? '' : '$number'} emit latest combined value when a child emit', () async {
      ${_observables(count, isList)}
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

String _observables(int count, bool isList) {
  return join(
    count,
    (n) => _observable(isList, n == count, n),
    '\n'
  );
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