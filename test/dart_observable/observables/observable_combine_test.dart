
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';
import '../../test_gen/combine_test/combine_test_annotation.dart';
import '../shared/observable_tester.dart';

part 'observable_combine_test.g.dart';

@observableCombineTest
void main() {
  _main();
}
