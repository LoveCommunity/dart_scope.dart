
import 'package:scopes/scopes.dart';

class StatesTester<T> {

  StatesTester(this._states);

  final States<T> _states;

  final List<T> recorded = [];

  Disposable? _observation;

  void startObserve() {
    _observation = _states.observe(recorded.add);
  }

  void stopObserve() {
    _observation?.dispose();
  }
}
