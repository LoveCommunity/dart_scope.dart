
import 'observable.dart';

/// `PipeObservable` transform an input observable (the source) 
/// to an output observable (itself).
/// 
/// Example:
/// 
/// ```dart
/// class ObservableMap<T, R> extends PipeObservable<T, R> {
///   
///   const ObservableMap({
///     required this.convert,
///     required super.source,
///   });
/// 
///   final R Function(T) convert;
/// 
///   @override
///   Disposable observe(OnData<R> onData) { ... }
/// }
/// ```
/// 
/// `ObservableMap<T, R>` is a `PipeObservable`, since it transform
/// an input `Observable<T>` to an output `Observable<R>`.
/// 
abstract class PipeObservable<T, R> implements Observable<R> {

  /// Create a `PipeObservable` with input source.
  const PipeObservable({
    required this.source,
  });

  /// The input observable
  final Observable<T> source;
}