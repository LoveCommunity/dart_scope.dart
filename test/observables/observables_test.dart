
import 'states/states_cache_test.dart' as states_cache_test;
import 'states/states_cast_test.dart' as states_cast_test;
import 'states/states_combine_test.dart' as states_combine_test;
import 'states/states_default_constructor_test.dart' as states_default_constructor_test;
import 'states/states_distinct_test.dart' as states_distinct_test;
import 'states/states_first_test.dart' as states_first_test;
import 'states/states_from_test.dart' as states_from_test;
import 'states/states_map_test.dart' as states_map_test;
import 'states/states_select_test.dart' as states_select_test;
import 'states/states_skip_test.dart' as states_skip_test;
import 'observables/observable_cast_test.dart' as observable_cast_test;
import 'observables/observable_combine_test.dart' as observable_combine_test;
import 'observables/observable_default_constructor_test.dart' as observable_default_constructor_test;
import 'observables/observable_distinct_map_test.dart' as observable_distinct_map_test;
import 'observables/observable_distinct_test.dart' as observable_distinct_test;
import 'observables/observable_map_test.dart' as observable_map_test;
import 'observables/observable_multicast_replay_test.dart' as observable_multicast_replay_test;
import 'observables/observable_multicast_test.dart' as observable_multicast_test;
import 'observables/observable_skip_test.dart' as observable_skip_test;
import 'observables/observable_where_test.dart' as observable_where_test;
import 'observables/proxy_observable_test.dart' as proxy_observable_test;
import 'observers/observer_default_constructor_test.dart' as observer_default_constructor_test;
import 'subjects/publish_subject_test.dart' as publish_subject_test;
import 'subjects/replay_subject_test.dart' as replay_subject_test;
import 'subjects/subject_test.dart' as subject_test;
import 'subjects/value_subject_test.dart' as value_subject_test;


void main() {
  states_cache_test.main();
  states_cast_test.main();
  states_combine_test.main();
  states_default_constructor_test.main();
  states_distinct_test.main();
  states_first_test.main();
  states_from_test.main();
  states_map_test.main();
  states_select_test.main();
  states_skip_test.main();
  observable_cast_test.main();
  observable_combine_test.main();
  observable_default_constructor_test.main();
  observable_distinct_map_test.main();
  observable_distinct_test.main();
  observable_map_test.main();
  observable_multicast_replay_test.main();
  observable_multicast_test.main();
  observable_skip_test.main();
  observable_where_test.main();
  proxy_observable_test.main();
  observer_default_constructor_test.main();
  publish_subject_test.main();
  replay_subject_test.main();
  subject_test.main();
  value_subject_test.main();
}
