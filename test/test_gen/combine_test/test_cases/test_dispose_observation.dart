
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testObservableCombineDisposeObservation(int? number) {
  final count = number ?? 2;
  return '''
    test('${observableCombineTestHeader(number)} dispose observation will dispose all source observations', () {
      ${code([
        invokesList(),
        ...observables(count, _observable),
        observableCombine(number),
        _startObserve(true),
        expectInvokesList<String>([]),
        _stopObserve(),
        expectInvokesList<String>(_expects(count)),
      ])}
    });
  ''';
}

String _observable(bool isLast, int n) {
  return '''
    final observable$n = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose$n');
      });
    });
  ''';
}

String _startObserve(bool isObservable) {
  final combineOrComputed = isObservable ? 'combine' : 'computed';
  return '''
    final observation = $combineOrComputed.observe((_) {});
  ''';
}

String _stopObserve() {
  return '''
    observation.dispose();
  ''';
}

List<String> _expects(int count) {
  return generateN(count, (n) => 'dispose$n'.boxed())
    .toList()
    .reversed
    .toList();
}

String testStatesComputedDisposeObservation(int? number) {
  final count = number ?? 2;
  return '''
    test('${statesComputedTestHeader(number)} dispose observation will dispose all source observations', () {
      ${code([
        invokesList(),
        ...statesIterable(count, _states),
        statesComputed(number),
        _startObserve(false),
        expectInvokesList<String>([]),
        _stopObserve(),
        expectInvokesList<String>(_expects(count)),
      ])}
    });
  ''';
}

String _states(bool isLast, int n) {
  return '''
    final states$n = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose$n');
      });
    });
  ''';
}