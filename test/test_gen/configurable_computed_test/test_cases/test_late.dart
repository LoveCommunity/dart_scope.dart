
import '../../shared/codes.dart' hide sampleStatesIterable;
import '../shared/codes.dart';

String testLazyIsOmitted(int? number) {
  final n = number!;
  return '''
    test('`Computed$number` compute lazily when `lazy` is omitted', () async {
      ${code([
        invokes(),
        _scopeRoot(n: n, assign: true, computedLazy: true),
        expectInvokes(0),
        getComputed(assign: false),
        expectInvokes(1),
      ])}
    });
  '''; 
}

String testLazyIsTrue(int? number) {
  final n = number!;
  return '''
    test('`Computed$number` compute lazily when `lazy` is true', () async {
      ${code([
        invokes(),
        _scopeRoot(n: n, assign: true, computedLazy: true),
        expectInvokes(0),
        getComputed(assign: false),
        expectInvokes(1),
      ])}
    });
  ''';
}

String testLazyIsFalse(int? number) {
  final n = number!;
  return '''
    test('`Computed$number` compute immediately when `lazy` is false', () async {
      ${code([
        invokes(),
        _scopeRoot(n: n, assign: false, computedLazy: false),
        expectInvokes(1),
      ])}
    });
  ''';
}

String _scopeRoot({
  required int n, 
  required bool assign,
  required bool? computedLazy,
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
        lazy: computedLazy,
      ),
    ],
  );
}
