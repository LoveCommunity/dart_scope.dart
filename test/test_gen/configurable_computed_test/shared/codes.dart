import '../../shared/codes.dart';

String sampleScopeRoot({
  required int n,
  bool awaiting = true,
}) => scopeRoot(
  awaiting: awaiting,
  configure: [
    sampleMockConfigurable(n),
    computed(n: n),
  ],
);

String sampleMockConfigurable(int n) {
  return mockConfigurable(body: [
    ...generateN(n, sampleStates),
    ...generateN(n, scopeExposeStates),
  ].join(''));
}

Iterable<String> sampleStatesIterable(int n) {
  return generateN(n, sampleStates);
}

String sampleStates(int n) {
  return '''
    final states$n = statesJust('${n}a');
  ''';
}

Iterable<String> scopeExposeStatesIterable(int n) {
  return generateN(n, scopeExposeStates);
}

String scopeExposeStates(int n) {
  return '''
    scope.expose<States<String>>(
      name: 'states$n',
      expose: () => states$n,
    );
  ''';
}

/// returns 'it1|it2|it3...|itn'
String combined(int n) {
  return join(n, (n) => '\$it$n', '|')
    .boxed();
}

String computed({
  required int n,
  String? computeBody,
  String? equalsBody,
  bool lazy = false,
}) {
  String types() {
    return join(n + 1, (n) => 'String', ', ');
  }
  String statesNames() {
    return join(n, (n) => "statesName$n: 'states$n',", '');
  }
  String compute() {
    final parameters = join(n, (n) => 'it$n', ', ');
    final body = computeBody ?? 'return ${combined(n)};';
    return 'compute: (scope, $parameters) {$body},';
  }
  String equals() {
    if (equalsBody == null) return '';
    return 'equals: (it1, it2) {$equalsBody},';
  }
  return '''
    Computed$n<${types()}>(
      name: 'computed',
      ${statesNames()}
      ${compute()}
      ${equals()}
      lazy: $lazy,
    )
  ''';
}

String getComputed({
  bool assign = true,
  String? assignTo,
}) {
  final computed = assign ? 'final ${assignTo ?? 'computed'} = ' : '';
  return computed + "scope.get<States<String>>(name: 'computed');";
}

String statesTester() {
  return '''
    final tester = StatesTester(
      computed,
    );
  ''';
}
