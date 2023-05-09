
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../../test_gen/combine_test/combine_test_annotation.dart';
import '../shared/states_tester.dart';

part 'states_computed_test.g.dart';

@statesComputedTest
void main() {
  _main();
}
