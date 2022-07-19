
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testObservableCombineEmitLatestCombinedValue(int? number) {
  final count = number ?? 2;
  return '''
    test('${observableCombineTestHeader(number)} emit latest combined value when a child emit', () async {
      ${[
        ...observables(count, sampleObservable),
        observableCombine(number),
        observableTester(),
        testerStartObserve(),
        expectTesterRecorded<String>(_expects1(count)),
        awaitEmptyFuture(),
        expectTesterRecorded<String>(_expects2(count)),
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
      (n) => '$n${!isLast(n) ? 'a' : 'b'}',
      '|'
    ).boxed()
  ];
}

String testStatesCombineEmitLatestCombinedValue(int? number) {
  final count = number ?? 2;
  return '''
    test('${statesCombineTestHeader(number)} emit latest combined value when a child emit', () async {
      ${[
        ...statesIterable(count, sampleStates),
        statesCombine(number),
        statesTester(),
        testerStartObserve(),
        expectTesterRecorded<String>(_expects1(count)),
        awaitEmptyFuture(),
        expectTesterRecorded<String>(_expects2(count)),
        testerStopObserve(),
      ].join('\n')}
    });
  ''';
}
