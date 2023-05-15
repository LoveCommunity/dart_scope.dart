import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../shared/codes.dart';
import 'combine_test_annotation.dart';
import 'test_cases/test_dispose_observation.dart';
import 'test_cases/test_emit_if_all_sources_emitted.dart';
import 'test_cases/test_emit_latest_combined_value.dart';
import 'test_cases/test_not_emit_after_observation_disposed.dart';
import 'test_cases/test_states_computed_default_equals.dart';
import 'test_cases/test_states_computed_custom_equals.dart';

class ObservableCombineTestGenerator extends GeneratorForAnnotation<ObservableCombineTest> {

  @override
  String generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    return testAll(
      tests: [
        testObservableCombineEmitIfAllSourcesEmitted,
        testObservableCombineEmitLatestCombinedValue,
        testObservableCombineDisposeObservation,
        testObservableCombineNotEmitAfterObservationDispose,
      ],
      numbers: [null, 2, 3, 4, 5, 6, 7, 8, 9],
    );
  }
}

class StatesComputedTestGenerator extends GeneratorForAnnotation<StatesComputedTest> {

  @override
  String generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    return testAll(
      tests: [
        testStatesComputedInitialEmit,
        testStatesComputedEmitLatestCombinedValue,
        testStatesComputedDisposeObservation,
        testStatesComputedNotEmitAfterObservationDispose,
        testStatesComputedDefaultEquals,
        testStatesComputedCustomEquals,
      ],
      numbers: [null, 2, 3],
    );
  }
}
