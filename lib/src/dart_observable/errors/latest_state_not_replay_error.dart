
import '../states/states.dart';

class LatestStateNotReplayError<T> extends Error {

  LatestStateNotReplayError(this._states);

  final States<T> _states;

  @override
  String toString() {
    return '$_states should replay latest state synchronously when observed';
  }
}
