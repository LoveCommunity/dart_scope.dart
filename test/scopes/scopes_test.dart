
import 'configurables/configurable_combine_test.dart' as configurable_combine_test;
import 'configurables/configurable_function_test.dart' as configurable_function_test;
import 'scope_methods/disposable_test.dart' as disposable_test;
import 'scope_methods/scope_get_test.dart' as scope_get_test;
import 'scope_methods/scope_push_test.dart' as scope_push_test;
import 'scopes/scope_test.dart' as scope_test;

void main() {
  configurable_combine_test.main();
  configurable_function_test.main();
  disposable_test.main();
  scope_get_test.main();
  scope_push_test.main();
  scope_test.main();
}
