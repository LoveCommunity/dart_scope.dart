import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../shared/codes.dart';
import 'test_cases/test_is_sync_configuration.dart';
import 'test_cases/test_compute_with_other_scope_value.dart';
import 'test_cases/test_custom_equals.dart';
import 'test_cases/test_default_equals.dart';
import 'test_cases/test_emit_latest_combined_value.dart';
import 'test_cases/test_late.dart';
import 'test_cases/test_not_forward_after_scope_disposed.dart';
import 'test_cases/test_share_same_instance.dart';
import 'configurable_computed_test_annotation.dart';

class ConfigurableComputedTestGenerator extends GeneratorForAnnotation<ConfigurableComputedTest> {

  @override
  String generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    return testAll(
      tests: [
        testIsSyncConfiguration,
        testShareSameInstance,
        testEmitLatestCombinedValue,
        testComputeWithOtherScopeValue,
        testNotForwardAfterScopeDisposed,
        testDefaultEquals,
        testCustomEquals,
        testLazyIsOmitted,
        testLazyIsTrue,
        testLazyIsFalse,
      ],
      numbers: [2, 3],
    );
  }
}
