
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testEmitLatestCombinedValue(int? number) {
  final isList = number == null;
  final count = number ?? 2;
  return '''
    test('combine observable${isList ? '' : '$number'} emit latest combined value when a child emit', () async {
      ${observables(isList, count, sampleObservable)}
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