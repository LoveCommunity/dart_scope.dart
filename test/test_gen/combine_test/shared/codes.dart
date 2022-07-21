
import '../../shared/codes.dart';

String observableCombineTestHeader(int? number) {
  return '`Observable.combine${number == null ? '' : '$number'}`';
}

String statesCombineTestHeader(int? number) {
  return '`States.combine${number == null ? '' : '$number'}`';
}

Iterable<String> observables(
  int count, 
  String Function(bool isLast, int n) observable
) {
  return generateN(
    count,
    (n) => observable(n == count, n),
  );
}

Iterable<String> statesIterable(
  int count,
  String Function(bool isLast, int n) states
) {
  return generateN(
    count,
    (n) => states(n == count, n),
  );
}

String sampleObservable(bool isLast, int n) {
  return '''
    final observable$n = Observable<String>((onData) {
       ${[
        "onData('${n}a');",
        if (isLast) "Future(() => onData('${n}b'));"
       ].join('\n')}
      return Disposable.empty;
    });
  ''';
}

String sampleStates(bool isLast, int n) {
  return '''
    final states$n = States<String>((setState) {
       ${[
        "setState('${n}a');",
        if (isLast) "Future(() => setState('${n}b'));"
       ].join('\n')}
      return Disposable.empty;
    });
  ''';
}

String observableCombine(int? number) {
  return _combine(true, number);
}

String statesCombine(int? number) {
  return _combine(false, number);
}

String _combine(bool isObservable, int? number) {
  final type = isObservable ? 'Observable' : 'States';
  final name = isObservable ? 'observable' : 'states';
  final children = isObservable ? 'observables' : 'children';
  final child = isObservable ? 'observable' : 'child';
  if (number == null) {
    return '''
      final combine = $type.combine<String, String>(
        $children: [
          ${name}1,
          ${name}2,
        ],
        combiner: (items) => '\${items[0]}|\${items[1]}',
      );
    ''';
  } else {
    String types() {
      return join(number, (n) => 'String', ', ') + ', String';
    }
    String children() {
      return join(number, (n) => '$child$n: $name$n,', '\n');
    }
    String combinerParameters() {
      return join(number, (n) => 'it$n', ', ');
    }
    String combinerBody() {
      return join(number, (n) => '\$it$n', '|');
    }
    return '''
      final combine = $type.combine$number<${types()}>(
        ${children()}
        combiner: (${combinerParameters()}) => '${combinerBody()}',
      );
    ''';
  }
}

String observableTester() {
  return '''
    final tester = ObservableTester(
      combine,
    );
  ''';
}

String statesTester() {
  return '''
    final tester = StatesTester(
      combine,
    );
  ''';
}

/// '1a|2a'
String joinAllA(int count) {
  return join(
    count, 
    (n) => '${n}a', 
    '|'
  ).boxed(); 
}
