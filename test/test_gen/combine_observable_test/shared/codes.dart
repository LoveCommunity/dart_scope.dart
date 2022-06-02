
import '../../shared/codes.dart';

String observables(
  bool isList,
  int count, 
  String Function(bool isList, bool isLast, int n) observable
) {
  return join(
    count,
    (n) => observable(isList, n == count, n),
    '\n'
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
      final combineObservable = Observable<String>.combine(
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
      final combineObservable = Observable.combine$number<${types()}>(
        ${children()}
        combiner: (${combinerParameters()}) => '${combinerBody()}',
      );
    ''';
  }
}

String combineObservableTester() {
  return '''
    final tester = ObservableTester(
      combineObservable,
    );
  ''';
}
