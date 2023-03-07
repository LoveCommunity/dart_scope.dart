
import 'observable.dart';

/// `InstanceAsObservable` provide an unified way to turn an instance 
/// to an observable.
/// 
/// ```dart
/// abstract class InstanceAsObservable<T, R> implements Observable<R> {
///   
///   const InstanceAsObservable(this.instance);
/// 
///   final T instance;
/// }
/// ```
/// 
/// Example - `ValueNotifierAsObservable`:
/// 
/// ```dart
/// class ValueNotifierAsObservable<T extends ValueNotifier<R>, R> 
///   extends InstanceAsObservable<T, R> {
///   
///   const ValueNotifierAsObservable(super.instance);
///   
///   @override
///   Disposable observe(OnData<R> onData) {
/// 
///     onData(instance.value);
/// 
///     void listener() => onData(instance.value);
/// 
///     instance.addListener(listener);
/// 
///     return Disposable(() {
///       instance.removeListener(listener);
///     });
///   }
/// }
/// ```
/// 
/// `ValueNotifierAsObservable` turns a `ValueNotifier<R>` to an `Observable<R>`:
/// 
/// ```dart
/// class Counter extends ValueNotifier<int> {
///   Counter(): super(0);
///   void increment() => value += 1;
/// }
/// 
/// void main() {
///   final counter = Counter();
///   final Observable<int> observable = ValueNotifierAsObservable(counter);
///   final observation = observable.observe((data) {
///     print('onData: $data');
///   }); 
///   counter.increment();
///   counter.increment();
///   observation.dispose();
/// }
/// ```
/// 
/// Prints:
///
/// ```
/// onData: 0
/// onData: 1
/// onData: 2
/// ``` 
/// 
abstract class InstanceAsObservable<T, R> implements Observable<R> {
  
  /// Create `InstanceAsObservable` with instance.
  const InstanceAsObservable(this.instance);

  /// The referenced instance.
  final T instance;
}