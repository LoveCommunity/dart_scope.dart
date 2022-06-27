
String testAll({
  required List<String Function(int?)> tests,
  required List<int?> numbers,
}) {
  final allTests = tests
    .expand((test) => numbers.map(test))
    .join('\n');
  return 'void _main() {$allTests}';
}

String testerStartObserve() {
  return'''
    tester.startObserve();
  ''';
}

String testerStopObserve() {
  return '''
    tester.stopObserve();
  ''';
}

String expectTesterRecorded(List<String> expects) {
  return expectList('tester.recorded', expects);
}

String expectInvokesList(List<String> expects) {
  return expectList('invokes', expects);
}

String expectList(String name, List<String> expects) {
  return '''
    expect($name, [
      ${expects.join(',\n')}
    ]);
  '''; 
}

String awaitEmptyFuture() {
  return '''
    await Future(() {});
  ''';
}

String join(int count, String Function(int) compute, [String joiner = '']) {
  return generateN(count, compute).join(joiner);
}

Iterable<T> generateN<T>(int count, T Function(int) compute) {
  return Iterable<T>.generate(count, (i) => compute(i +1));
}

extension BoxedX on String {

  String boxed([String char="'"]) => char + this + char;
}
