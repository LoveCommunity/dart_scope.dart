
import '../../shared/codes.dart';

Iterable<String> observables(
  bool isList,
  int count, 
  String Function(bool isList, bool isLast, int n) observable
) {
  return generateN(
    count,
    (n) => observable(isList, n == count, n),
  );
}

String sampleObservable(bool isList, bool isLast, int n) {
  return '''
    final observable$n = Observable<${isList ? 'Object?' : 'String'}>((onData) {
       ${[
        "onData('${n}a');",
        if (isLast) "Future(() => onData('${n}b'));"
       ].join('\n')}
      return Disposable.empty;
    });
  ''';
}

String combineObservable(int? number) {
  if (number == null) {
    return '''
      final combine = Observable<String>.combine(
        children: [
          observable1,
          observable2,
        ],
        combiner: (items) => '\${items[0]}|\${items[1]}',
      );
    ''';
  } else {
    String types() {
      return join(number, (n) => 'String', ', ') + ', String';
    }
    String children() {
      return join(number, (n) => 'child$n: observable$n,', '\n');
    }
    String combinerParameters() {
      return join(number, (n) => 'it$n', ', ');
    }
    String combinerBody() {
      return join(number, (n) => '\$it$n', '|');
    }
    return '''
      final combine = Observable.combine$number<${types()}>(
        ${children()}
        combiner: (${combinerParameters()}) => '${combinerBody()}',
      );
    ''';
  }
}

String combineObservableTester() {
  return '''
    final tester = ObservableTester(
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
