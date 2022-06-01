
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
  return expects.isEmpty
    ? '''
      expect(tester.recorded, []);
    '''
    : '''
      expect(tester.recorded, [
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