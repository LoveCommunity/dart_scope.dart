
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testShareSameInstance(int? number) {
  final n = number!;
  return '''
    test('Computed$number share same instance in scope with name', () async {
      ${code([
        sampleScopeRoot(n: n),
        ...generateN(2, (n) => getComputed(assignTo: 'computed$n')),
        _isIdentical(),
        _expect(),
      ])}
    });
  ''';
}

String _isIdentical() => 'final isIdentical = identical(computed1, computed2);';

String _expect() => 'expect(isIdentical, true);';
