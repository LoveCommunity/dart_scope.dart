
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testObservableCombineEmitIfAllSourcesEmitted(int? number) {
  final count = number ?? 2;
  return '''
    test('${observableCombineTestHeader(number)} emit if all sources emitted', () async {
      ${code([
        ...observables(count, _observable),
        observableCombine(number),
        observableTester(),
        testerStartObserve(),
        expectTesterRecorded<String>([]),
        awaitEmptyFuture(),
        expectTesterRecorded<String>(expectsAllA(count)),
        testerStopObserve(),
      ])}
    });
  ''';
}

String _observable(bool isLast, int n) {
  final onData = "onData('${n}a')";
  return '''
    final observable$n = Observable<String>((onData) {
      ${!isLast
        ? "$onData;"
        : "Future(() => $onData);" 
      }
      return Disposable.empty;
    });
  ''';
}

String testStatesComputedInitialEmit(int? number) {
  final count = number ?? 2;
  return '''
    test('${statesComputedTestHeader(number)} initial emit', () {
      ${code([
        ...statesIterable(count, _states),
        statesComputed(number),
        statesTester(),
        expectTesterRecorded<String>([]),
        testerStartObserve(),
        expectTesterRecorded<String>(expectsAllA(count)),
        testerStopObserve(),
      ])}
    });
  ''';
}

String _states(bool isLast, int n) {
  return '''
    final states$n = States<String>((setState) {
      setState('${n}a');
      return Disposable.empty;
    });
  ''';
}
