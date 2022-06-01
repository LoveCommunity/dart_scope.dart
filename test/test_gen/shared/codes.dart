
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

String expectTesterRecorded(Iterable<String> expects) {
  return expect('tester.recorded', expects);
}

String expectInvokes(Iterable<String> expects) {
  return expect('invokes', expects);
}

String expect(String name, Iterable<String> expects) {
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