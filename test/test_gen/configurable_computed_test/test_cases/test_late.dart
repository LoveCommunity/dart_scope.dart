
import '../../shared/codes.dart' hide sampleStatesIterable;
import '../shared/codes.dart';

String testLateIsFalse(int? number) {
  final n = number!;
  return '''
    test('`Computed$number` compute immediately when late is false', () async {
      ${code([
        intInvokes(),
        _scopeRoot(n: n, assign: false, computedLate: false),
        expectInvokes(1),
      ])}
    });
  ''';
}

String testLateIsTrue(int? number) {
  final n = number!;
  return '''
    test('`Computed$number` compute immediately when late is true', () async {
      ${code([
        intInvokes(),
        _scopeRoot(n: n, assign: true, computedLate: true),
        expectInvokes(0),
        getComputed(assign: false),
        expectInvokes(1),
      ])}
    });
  ''';
}


String _scopeRoot({
  required int n, 
  required bool assign,
  required bool computedLate,
}) {
  return scopeRoot(
    assign: assign,
    configure: [
      mockConfigurable(
        body: [
          ...sampleStatesIterable(n),
          ...scopeExposeStatesIterable(n),
        ].join(''),
      ),
      computed(
        n: n,
        computeBody: '''
          invokes += 1;
          return ${combined(n)};
        ''',
        late: computedLate,
      ),
    ],
  );
}
