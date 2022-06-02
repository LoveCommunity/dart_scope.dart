
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'combine_observable_test/combine_observable_test_generator.dart';

Builder testBuilder(BuilderOptions options) {
  return SharedPartBuilder(
    [
      CombineObservableTestGenerator(),
    ],
    'test_builder',
  );
}
