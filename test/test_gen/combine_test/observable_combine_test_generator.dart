import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../shared/codes.dart';
import 'observable_combine_test.dart';
import 'test_cases/test_dispose_observation.dart';
import 'test_cases/test_emit_if_all_children_emitted.dart';
import 'test_cases/test_emit_latest_combined_value.dart';
import 'test_cases/test_not_emit_after_observation_disposed.dart';

class ObservableCombineTestGenerator extends GeneratorForAnnotation<ObservableCombineTest> {

  @override
  String generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    return testAll(
      tests: [
        testObservableCombineEmitIfAllChildrenEmitted,
        testObservableCombineEmitLatestCombinedValue,
        testObservableCombineDisposeObservation,
        testObservableCombineNotEmitAfterObservationDispose,
      ],
      numbers: [null, 2, 3],
    );
  }
}

