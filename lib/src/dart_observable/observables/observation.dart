
import 'package:disposal/disposal.dart';
import 'package:meta/meta.dart';

import 'observable.dart';
import '../observers/observer.dart';

/// `Observation` is the observe action that an observer observes an observable.
/// 
/// `Observation ~ ObservAtion ~ Observe Action` is often happened when 
/// there is an intention to connect `Observable` and `Observer`.
/// 
/// Example:
/// 
/// Part 1/2:
/// 
/// ```dart
/// void main() {
///   final observable = ObservableFromIterable<int>([1, 2, 3]);
///   final observer = Observer<int>((data) {
///     print('onData: $data');
///   });
///   final observation = observable.observe(observer.onData);
///   observation.dispose();
/// }
/// ```
/// 
/// Prints:
/// 
/// ```
/// onData: 1
/// onData: 2
/// onData: 3
/// ```
/// 
/// - `Observable` is the logical configuration describe what items to be produced.
/// - `Observer` handles those items.
/// - `Observation` apply `Observable`'s logical configuration and produces
///   those items then delivery to `Observer`.
/// 
/// Part 2/2:
/// 
/// Implementation of `ObservableFromIterable` with its `Observation`.
/// 
/// ```dart
/// class ObservableFromIterable<T> implements Observable<T> {
/// 
///   ObservableFromIterable(this.iterable);
/// 
///   final Iterable<T> iterable;
/// 
///   @override
///   Disposable observe(OnData<T> onData) {
///     return _Observation(    // Make the connection between
///       configuration: this,  // the observable (configuration)
///       emit: onData,         // and observer   (emit)
///     );
///   }
/// }
/// 
/// class _Observation<T> extends Observation<ObservableFromIterable<T>, T> {
///   
///   _Observation({
///     required super.configuration, 
///     required super.emit
///   });
/// 
///   Iterator<T>? _iterator; 
/// 
///   @override
///   void init() {
///     _iterator = configuration.iterable.iterator;
///     _iterate(_iterator!);
///   }
/// 
///   void _iterate(Iterator<T> iterator) {
///     while (iterator.moveNext()) {
///       emit(iterator.current);
///     }
///   }
/// 
///   @override
///   void dispose() {
///     _iterator = null;
///   }
/// }
/// ```
/// 
abstract class Observation<O extends Observable<T>, T> implements Disposable {

  /// Create `Observation` with `configuration` and `emit`.
  Observation({
    required this.configuration,
    required this.emit,
  }) {
    init();
  }

  /// Observable is the configuration.
  final O configuration;
  /// Observer is emit.
  final OnData<T> emit;

  /// Initialize the observation.
  @mustCallSuper
  void init();
}