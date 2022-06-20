
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testObservableCombineDisposeObservation(int? number) {
  final isList = number == null;
  final count = number ?? 2;
  return '''
    test('${observableCombineTestHeader(number)} dispose observation will dispose all children observations', () {
      ${[
        _invokes(),
        ...observables(isList, count, _observable),
        observableCombine(number),
        _startObserve(),
        expectInvokesList([]),
        _stopObserve(),
        expectInvokesList(_expects(count)),
      ].join('\n')}
    });
  ''';
}

String _invokes() {
  return '''
    final List<String> invokes = [];
  ''';
}

String _observable(bool isList, bool isLast, int n) {
  return '''
    final observable${n} = Observable<${isList ? 'Object?' : 'String'}>((onData) {
      return Disposable(() {
        invokes.add('dispose$n');
      });
    });
  ''';
}

String _startObserve() {
  return '''
    final observation = combine.observe((data) {});
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

String testDriverCombineDisposeObservation(int? number) {
  final isList = number == null;
  final count = number ?? 2;
  return '''
    test('${driverCombineTestHeader(number)} dispose observation will dispose all children observations', () {
      ${[
        _invokes(),
        ...drivers(isList, count, _driver),
        driverCombine(number),
        _startDrive(),
        expectInvokesList([]),
        _stopDrive(),
        expectInvokesList(_expects(count)),
      ].join('\n')}
    });
  ''';
}

String _driver(bool isList, bool isLast, int n) {
  return '''
    final driver${n} = Driver<${isList ? 'Object?' : 'String'}>((onData) {
      return Disposable(() {
        invokes.add('dispose$n');
      });
    });
  ''';
}

String _startDrive() {
  return '''
    final observation = combine.drive((data) {});
  ''';
}

String _stopDrive() {
  return _stopObserve();
}
