
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'combine_test/combine_test_generator.dart';

Builder testBuilder(BuilderOptions options) {
  return SharedPartBuilder(
    [
      ObservableCombineTestGenerator(),
    ],
    'test_builder',
  );
}
