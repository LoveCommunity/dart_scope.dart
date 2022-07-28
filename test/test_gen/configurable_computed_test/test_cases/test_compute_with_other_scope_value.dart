

import '../../shared/codes.dart' hide sampleStatesIterable;
import '../shared/codes.dart';

String testComputeWithOtherScopeValue(int? number) {
  final n = number!;
  return '''
    test('`Computed$number` compute with other scope value', () async {
      ${code([
        _scopeRoot(n),
        getComputed(),
        _first(),
        _expect(n),
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
          _scopeExposeInt(),
        ].join(''),
      ),
      computed(
        n: n,
        computeBody: """
          final value = scope.get<int>();
          return ${Iterable
            .generate(n + 1, (i) => i == 0 ? '\$value' : '\$it$i')
            .join('|')
            .boxed()
          };
        """,
      ),
    ],
  );
}

String _scopeExposeInt() => 'scope.expose<int>(expose: () => 0);';

String _first() => 'final first = computed.first;';

String _expect(int n) {
  final result = Iterable.generate(
    n + 1, 
    (i) => i == 0 ? '0' : '${i}a',
  ).join('|')
    .boxed();
  return 'expect(first, $result);';
}
