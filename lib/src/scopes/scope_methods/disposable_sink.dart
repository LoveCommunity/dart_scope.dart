
import 'package:disposal/disposal.dart';

abstract class DisposableSink {

  void addDisposable(Disposable disposable);
  void addDisposables(List<Disposable> disposables);
}
