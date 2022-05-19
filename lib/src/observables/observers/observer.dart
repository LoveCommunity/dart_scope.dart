
typedef OnData<T> = void Function(T data);

abstract class Observer<T> {

  void onData(T data);
}
