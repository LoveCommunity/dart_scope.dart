
import 'drivers/cache_driver_test.dart' as cache_driver_test;
import 'drivers/cast_driver_test.dart' as cast_driver_test;
import 'drivers/from_driver_test.dart' as from_driver_test;
import 'drivers/create_driver_test.dart' as create_driver_test;
import 'drivers/distinct_driver_test.dart' as distinct_driver_test;
import 'drivers/map_driver_test.dart' as map_driver_test;
import 'drivers/select_driver_test.dart' as select_driver_test;
import 'observables/create_observable_test.dart' as create_observable_test;
import 'observables/cast_observable_test.dart' as cast_observable_test;
import 'observables/combine_observable_test.dart' as combine_observable_test;
import 'observables/map_observable_test.dart' as map_observable_test;
import 'observables/multicast_observable_test.dart' as multicast_observable_test;
import 'observables/multicast_replay_observable_test.dart' as multicast_replay_observable_test;
import 'observables/distinct_observable_test.dart' as distinct_observable_test;
import 'observables/distinct_map_observable_test.dart' as distinct_map_observable_test;
import 'observables/proxy_observable_test.dart' as proxy_observable_test;
import 'observables/skip_observable_test.dart' as skip_observable_test;
import 'observables/where_observable_test.dart' as where_observable_test;
import 'observers/observer_test.dart' as observer_test;
import 'subjects/publish_subject_test.dart' as publish_subject_test;
import 'subjects/replay_subject_test.dart' as replay_subject_test;
import 'subjects/subject_test.dart' as subject_test;
import 'subjects/value_subject_test.dart' as value_subject_test;


void main() {
  cache_driver_test.main();
  cast_driver_test.main();
  create_driver_test.main();
  distinct_driver_test.main();
  from_driver_test.main();
  map_driver_test.main();
  select_driver_test.main();
  create_observable_test.main();
  cast_observable_test.main();
  combine_observable_test.main();
  distinct_observable_test.main();
  distinct_map_observable_test.main();
  map_observable_test.main();
  multicast_observable_test.main();
  multicast_replay_observable_test.main();
  proxy_observable_test.main();
  skip_observable_test.main();
  where_observable_test.main();
  observer_test.main();
  publish_subject_test.main();
  replay_subject_test.main();
  subject_test.main();
  value_subject_test.main();
}
