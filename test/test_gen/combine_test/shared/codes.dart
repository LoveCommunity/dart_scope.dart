
import '../../shared/codes.dart';

String observableCombineTestHeader(int? number) {
  return '`Observable.combine${number == null ? '' : '$number'}`';
}

String statesCombineTestHeader(int? number) {
  return '`States.combine${number == null ? '' : '$number'}`';
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
  final sources = isObservable ? 'observables' : 'states';
  final source = isObservable ? 'observable' : 'states';
  if (number == null) {
    return '''
      final combine = $type.combine<String, String>(
        $sources: [
          ${name}1,
          ${name}2,
        ],
        combiner: (items) => '\${items[0]}|\${items[1]}',
      );
    ''';
  } else {
    String types() {
      return '${join(number, (n) => 'String', ', ')}, String';
    }
    String sources() {
      return join(number, (n) => '$source$n: $name$n,', '\n');
    }
    String combinerParameters() {
      return join(number, (n) => 'it$n', ', ');
    }
    String combinerBody() {
      return join(number, (n) => '\$it$n', '|');
    }
    return '''
      final combine = $type.combine$number<${types()}>(
        ${sources()}
        combiner: (${combinerParameters()}) => '${combinerBody()}',
      );
    ''';
  }
}

String observableTester() {
  return assignObservableTester('combine');
}

String statesTester() {
  return assignStatesTester('combine');
}
