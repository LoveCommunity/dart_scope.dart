
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testShareSameInstance(int? number) {
  final n = number!;
  return '''
    test('`Computed$number` share same instance in scope with name', () async {
      ${[
        sampleScopeRoot(n: n),
        ...generateN(n, (n) => getComputed(assignTo: 'computed$n')),
        _isIdentical(),
        _expect(),
      ].join('\n')}
    });
  ''';
}

String _isIdentical() => 'final isIdentical = identical(computed1, computed2);';

String _expect() => 'expect(isIdentical, true);';
