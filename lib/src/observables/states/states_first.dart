
import 'package:meta/meta.dart';

import '../../shared/value.dart';
import '../errors/latest_state_not_replay_error.dart';
import 'states.dart';

@internal
T statesFirst<T>(States<T> states) {
  Value<T>? first;
  states.observe((state) {
    if (first == null) {
      first = Value(state);
    }
  })
  .dispose();
  if (first == null) {
    throw LatestStateNotReplayError(states);
  }
  return first!.value;
}
