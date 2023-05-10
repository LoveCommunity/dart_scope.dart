
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

String statesComputed(int? number, [bool useCustomEquals = false]) {
  return _combine(false, number, useCustomEquals);
}

String _combine(bool isObservable, int? number, [bool useCustomEquals = false]) {
  final type = isObservable ? 'Observable' : 'States';
  final name = isObservable ? 'observable' : 'states';
  final combineOrComputed = isObservable ? 'combine' : 'computed';
  final combinerOrCompute = isObservable ? 'combiner' : 'compute';
  final sources = isObservable ? 'sources' : 'states';
  final source = isObservable ? 'source' : 'states';
  final maybeCustomEquals = useCustomEquals 
    ? 'equals: (it1, it2) => it1.length == it2.length,' 
    : '';
  if (number == null) {
    return '''
      final $combineOrComputed = $type.$combineOrComputed<String, String>(
        $sources: [
          ${name}1,
          ${name}2,
        ],
        $combinerOrCompute: (items) => '\${items[0]}|\${items[1]}',
        $maybeCustomEquals
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
        $maybeCustomEquals
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
