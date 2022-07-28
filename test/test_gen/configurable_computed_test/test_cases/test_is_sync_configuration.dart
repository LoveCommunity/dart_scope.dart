
import '../shared/codes.dart';

String testIsSyncConfiguration(int? number) {
  final n = number!;
  return '''
    test('`Computed$number` is sync configuration', () {
      ${[
        sampleScopeRoot(n: n, awaiting: false),
        _expect(),
      ].join('\n')}
    });
  ''';
}

String _expect() {
  return 'expect(scope, isA<Scope>());';
}
