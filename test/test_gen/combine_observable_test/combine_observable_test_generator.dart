import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'combine_observable_test.dart';
import 'test_cases/test_emit_if_all_children_emitted.dart';
import 'test_cases/test_emit_latest_combined_value.dart';

class CombineObservableTestGenerator extends GeneratorForAnnotation<CombineObservableTest> {

  @override
  String generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    return _main();
  }
}

String _main() {
  final tests = _tests
    .expand((_test) => _numbers.map(_test))
    .join('\n');
  return 'void _main() {$tests}';
}

const _tests = [
  testEmitLatestCombinedValue,
  testEmitIfAllChildrenEmitted,
];

const _numbers = [null, 2];
