
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'combine_test/observable_combine_test_generator.dart';

Builder testBuilder(BuilderOptions options) {
  return SharedPartBuilder(
    [
      CombineObservableTestGenerator(),
    ],
    'test_builder',
  );
}
