
import '../states/states.dart';

/// An error indicate `States` not replay latest value synchronously
/// to observer when observed, while states promising this behavior.
class LatestStateNotReplayError<T> extends Error {

  /// Create `LatestStateNotReplayError` with states 
  /// which has unexpected behavior.
  LatestStateNotReplayError(this._states);

  final States<T> _states;

  @override
  String toString() {
    return '$_states should replay latest state synchronously when observed';
  }
}
