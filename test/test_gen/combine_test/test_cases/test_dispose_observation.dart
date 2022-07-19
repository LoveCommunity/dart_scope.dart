
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testObservableCombineDisposeObservation(int? number) {
  final count = number ?? 2;
  return '''
    test('${observableCombineTestHeader(number)} dispose observation will dispose all children observations', () {
      ${[
        _invokes(),
        ...observables(count, _observable),
        observableCombine(number),
        _startObserve(),
        expectInvokesList<String>([]),
        _stopObserve(),
        expectInvokesList<String>(_expects(count)),
      ].join('\n')}
    });
  ''';
}

String _invokes() {
  return '''
    final invokes = <String>[];
  ''';
}

String _observable(bool isLast, int n) {
  return '''
    final observable${n} = Observable<String>((onData) {
      return Disposable(() {
        invokes.add('dispose$n');
      });
    });
  ''';
}

String _startObserve() {
  return '''
    final observation = combine.observe((_) {});
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

String testStatesCombineDisposeObservation(int? number) {
  final count = number ?? 2;
  return '''
    test('${statesCombineTestHeader(number)} dispose observation will dispose all children observations', () {
      ${[
        _invokes(),
        ...states_iterable(count, _states),
        statesCombine(number),
        _startObserve(),
        expectInvokesList<String>([]),
        _stopObserve(),
        expectInvokesList<String>(_expects(count)),
      ].join('\n')}
    });
  ''';
}

String _states(bool isLast, int n) {
  return '''
    final states${n} = States<String>((setState) {
      return Disposable(() {
        invokes.add('dispose$n');
      });
    });
  ''';
}