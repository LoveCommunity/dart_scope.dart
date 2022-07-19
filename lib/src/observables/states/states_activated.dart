
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../subjects/replay_subject.dart';
import 'observable_as_states_x.dart';
import 'states.dart';

abstract class HasStates<T> {
  States<T> get states;
}

abstract class StatesActivated<T> implements HasStates<T>, Disposable {
  @internal
  factory StatesActivated({
    required States<T> child
  }) = _StatesActivated;
}

class _StatesActivated<T> implements StatesActivated<T> {

  _StatesActivated({
    required States<T> child
  }): _child = child {
    _startObserve();
  }

  final States<T> _child;
  final _subject = ReplaySubject<T>(bufferSize: 1);

  @override
  late final states = _subject.asStates();

  late final Disposable _observation;

  void _startObserve() {
    _observation = _child.observe(_subject.onData);
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
