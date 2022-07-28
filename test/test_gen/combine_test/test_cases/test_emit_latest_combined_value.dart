
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testObservableCombineEmitLatestCombinedValue(int? number) {
  final count = number ?? 2;
  return '''
    test('${observableCombineTestHeader(number)} emit latest combined value when a source emit', () async {
      ${code([
        ...observables(count, sampleObservable),
        observableCombine(number),
        observableTester(),
        testerStartObserve(),
        expectTesterRecorded<String>(_expects1(count)),
        awaitEmptyFuture(),
        expectTesterRecorded<String>(_expects2(count)),
        testerStopObserve(),
      ])}
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
    test('${statesCombineTestHeader(number)} emit latest combined value when a source emit', () async {
      ${code([
        ...statesIterable(count, sampleStates),
        statesCombine(number),
        statesTester(),
        testerStartObserve(),
        expectTesterRecorded<String>(_expects1(count)),
        awaitEmptyFuture(),
        expectTesterRecorded<String>(_expects2(count)),
        testerStopObserve(),
      ])}
    });
  ''';
}
