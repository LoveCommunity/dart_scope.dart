
import 'package:meta/meta.dart';

import '../../shared/value.dart';
import '../errors/latest_state_not_replay_error.dart';
import 'states.dart';

@internal
T statesFirst<T>(States<T> states) {
  Value<T>? result;
  states.observe((data) {
    if (result == null) {
      result = Value(data);
    }
  })
  .dispose();
  if (result == null) {
    throw LatestStateNotReplayError(states);
  }
  return result!.value;
}
