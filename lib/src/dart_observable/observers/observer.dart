
import 'observer_function.dart';

/// `OnData` is a function describe how to handle data.
/// 
/// ```dart
/// final OnData<int> onData = (data) {
///   print('onData: $data'); // handle data
/// };
/// ```
/// 
typedef OnData<T> = void Function(T data);

/// `Observer` is someone who observe something.
/// 
/// Technical speaking, `Observer` is an interface that
/// has an `onData` method:
/// 
/// ```dart
/// abstract class Observer<T> {
///   void onData(T data);
/// }
/// ```
/// 
/// Example:
/// 
/// ```dart
/// final observer = Observer<int>((data) {
///   print('onData: $data');
/// });
/// ```
/// 
/// Above example create an `Observer` using inline `onData` 
/// method `(data) { ... }`. Then we can notify observer using
/// `observer.onData`:
/// 
/// ```dart
/// observer.onData(0); // prints:  onData: 0
/// observer.onData(1); //          onData: 1
/// observer.onData(2); //          onData: 2
/// ```
/// 
abstract class Observer<T> {
  
  /// Use `observer.onData` to notify observer.
  ///
  /// ```dart
  /// observer.onData(0);
  /// observer.onData(1);
  /// observer.onData(2);
  /// ``` 
  /// 
  void onData(T data);

  /// Use `Observer(...)` to create an `Observer` with 
  /// an inline `onData` method `(data) { ... }`.
  /// 
  /// ```dart
  /// final observer = Observer<int>((data) {
  ///   print('onData: $data');
  /// });
  /// ```
  const factory Observer(
    OnData<T> onData
  ) = ObserverFunction;
}
