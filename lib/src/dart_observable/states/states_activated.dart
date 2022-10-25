
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../subjects/replayer.dart';
import 'observable_as_states_x.dart';
import 'states.dart';

abstract class HasStates<T> {
  States<T> get states;
}

abstract class StatesActivated<T> implements HasStates<T>, Disposable {
  @internal
  factory StatesActivated({
    required States<T> states
  }) = _StatesActivated;
}

class _StatesActivated<T> implements StatesActivated<T> {

  _StatesActivated({
    required States<T> states
  }): _states = states {
    _startObserve();
  }

  final States<T> _states;
  final _subject = Replayer<T>(bufferSize: 1);

  @override
  late final states = _subject.asStates();

  late final Disposable _observation;

  void _startObserve() {
    _observation = _states.observe(_subject.onData);
  }

  void _stopObserve() {
    _observation.dispose();
  }

  @override
  void dispose() {
    _stopObserve();
    _subject.dispose();
  }
}
