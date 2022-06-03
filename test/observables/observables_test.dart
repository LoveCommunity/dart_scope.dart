
import 'observables/create_observable_test.dart' as create_observable_test;
import 'observables/cast_observable_test.dart' as cast_observable_test;
import 'observables/combine_observable_test.dart' as combine_observable_test;
import 'observables/map_observable_test.dart' as map_observable_test;
import 'observables/distinct_observable_test.dart' as distinct_observable_test;
import 'observables/proxy_observable_test.dart' as proxy_observable_test;
import 'observables/where_observable_test.dart' as where_observable_test;
import 'observers/observer_test.dart' as observer_test;


void main() {
  create_observable_test.main();
  cast_observable_test.main();
  combine_observable_test.main();
  distinct_observable_test.main();
  map_observable_test.main();
  proxy_observable_test.main();
  where_observable_test.main();
  observer_test.main();
}
