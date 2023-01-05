
import 'package:disposal/disposal.dart';

/// `DisposableSink` is an interface that expose 
/// `disposableSink.addDisposable` and 
/// `disposableSink.addDisposables` methods.
abstract class DisposableSink {

  /// add a `disposable` to current sink.
  void addDisposable(Disposable disposable);
  /// add a list of `disposable` to current sink.
  void addDisposables(List<Disposable> disposables);
}

/// `DisposableSinkX` is an extension to `DisposableSink`
/// that adds a `disposableSink.addDispose` method.
extension DisposableSinkX on DisposableSink {

  /// add a `dispose` callback to current sink.
  void addDispose(VoidCallback dispose) {
    addDisposable(Disposable(dispose));
  }
}
