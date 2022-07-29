import 'package:dart_scope/dart_scope.dart';

class ObservableTester<T> {

  ObservableTester(this._observable);

  final Observable<T> _observable;

  final List<T> recorded = [];

  Disposable? _observation;

  void startObserve() {
    _observation = _observable.observe(recorded.add);
  }

  void stopObserve() {
    _observation?.dispose();
  }
} 
