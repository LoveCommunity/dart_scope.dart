
import '../../shared/codes.dart';
import '../shared/codes.dart' hide sampleStatesIterable;

String testEmitLatestCombinedValue(int? number) {
  final n = number!;
  return '''
    test('Computed$number emit latest combined value when a source emit', () async {
      ${code([
        _scopeRoot(n),
        getComputed(),
        statesTester(),
        testerStartObserve(),
        expectTesterRecorded<String>(expectsAllA(n)),
        awaitEmptyFuture(),
        expectTesterRecorded<String>(expectsAB(n)),
        testerStopObserve(),
      ])}
    });
  ''';
}

String _scopeRoot(int n) {
  return scopeRoot(
    configure: [
      mockConfigurable(
        body: [
          ...sampleStatesIterable(n),
          ...scopeExposeStatesIterable(n),
        ].join(''),
      ),
      computed(
        n: n,
      ),
    ],
  );
}
