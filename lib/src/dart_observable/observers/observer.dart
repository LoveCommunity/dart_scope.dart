
import 'observer_function.dart';

typedef OnData<T> = void Function(T data);

abstract class Observer<T> {

  void onData(T data);

  const factory Observer(
    OnData<T> onData
  ) = ObserverFunction;
}
