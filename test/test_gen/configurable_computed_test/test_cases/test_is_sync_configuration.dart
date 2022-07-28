
import '../../shared/codes.dart';
import '../shared/codes.dart';

String testIsSyncConfiguration(int? number) {
  final n = number!;
  return '''
    test('`Computed$number` is sync configuration', () {
      ${code([
        sampleScopeRoot(n: n, awaiting: false),
        _expect(),
      ])}
    });
  ''';
}

String _expect() {
  return 'expect(scope, isA<Scope>());';
}
