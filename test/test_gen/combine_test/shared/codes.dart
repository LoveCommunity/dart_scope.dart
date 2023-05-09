
import '../../shared/codes.dart';

String observableCombineTestHeader(int? number) {
  return 'Observable.combine${number == null ? '' : '$number'}';
}

String statesComputedTestHeader(int? number) {
  return 'States.computed${number == null ? '' : '$number'}';
}
String observableCombine(int? number) {
  return _combine(true, number);
}

String statesComputed(int? number) {
  return _combine(false, number);
}

String _combine(bool isObservable, int? number) {
  final type = isObservable ? 'Observable' : 'States';
  final name = isObservable ? 'observable' : 'states';
  final combineOrComputed = isObservable ? 'combine' : 'computed';
  final combinerOrCompute = isObservable ? 'combiner' : 'compute';
  final sources = isObservable ? 'sources' : 'states';
  final source = isObservable ? 'source' : 'states';
  if (number == null) {
    return '''
      final $combineOrComputed = $type.$combineOrComputed<String, String>(
        $sources: [
          ${name}1,
          ${name}2,
        ],
        $combinerOrCompute: (items) => '\${items[0]}|\${items[1]}',
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
      final $combineOrComputed = $type.$combineOrComputed$number<${types()}>(
        ${sources()}
        $combinerOrCompute: (${combinerParameters()}) => '${combinerBody()}',
      );
    ''';
  }
}

String observableTester() {
  return assignObservableTester('combine');
}

String statesTester() {
  return assignStatesTester('computed');
}
