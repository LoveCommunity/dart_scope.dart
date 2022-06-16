
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testEmitLatestCombinedValue(int? number) {
  final isList = number == null;
  final count = number ?? 2;
  return '''
    test('`Observable.combine${isList ? '' : '$number'}` emit latest combined value when a child emit', () async {
      ${[
        ...observables(isList, count, sampleObservable),
        combineObservable(number),
        combineObservableTester(),
        testerStartObserve(),
        expectTesterRecorded(_expects1(count)),
        awaitEmptyFuture(),
        expectTesterRecorded(_expects2(count)),
        testerStopObserve(),
      ].join('\n')}
    });
  ''';
}


List<String> _expects1(int count) {
  return [
    joinAllA(count), // '1a|2a'
  ];
}

List<String> _expects2(int count) {
  bool isLast(int n) => n == count;
  return [
    joinAllA(count), // '1a|2a'
    join(                                     // '1a|2b'
      count,
      (n) => '${n}${!isLast(n) ? 'a' : 'b'}',
      '|'
    ).boxed()
  ];
}