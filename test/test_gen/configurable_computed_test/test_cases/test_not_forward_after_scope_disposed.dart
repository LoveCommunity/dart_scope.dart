
import '../../shared/codes.dart';
import '../shared/codes.dart' hide sampleStatesIterable;

String testNotForwardAfterScopeDisposed(int? number) {
  final n = number!;
  return '''
    test("`Computed$number` exposed `States` won't forward data after scope disposed", () async {
      ${code([
        _scopeRoot(n),
        getComputed(),
        statesTester(),
        testerStartObserve(),
        scopeDispose(),
        expectTesterRecorded<String>(expectsAllA(n)),
        awaitEmptyFuture(),
        expectTesterRecorded<String>(expectsAllA(n)),
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
      computed(n: n),
    ],
  );
}
