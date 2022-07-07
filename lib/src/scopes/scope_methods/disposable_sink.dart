
import 'package:disposal/disposal.dart';
import 'package:typedef_foundation/typedef_foundation.dart';

abstract class DisposableSink {

  void addDisposable(Disposable disposable);
  void addDisposables(List<Disposable> disposables);
}

extension DisposableSinkX on DisposableSink {

  void addDispose(VoidCallback dispose) {
    addDisposable(Disposable(dispose));
  }
}
