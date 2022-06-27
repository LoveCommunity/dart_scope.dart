
import '../states/states.dart';

class StatesLatestValueNotReplayError<T> extends Error {

  StatesLatestValueNotReplayError(this._states);

  final States<T> _states;

  @override
  String toString() {
    return '$_states should replay latest value synchronousy when observed';
  }
}
