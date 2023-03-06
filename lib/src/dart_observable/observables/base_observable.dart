
import 'observable.dart';

/// `PipeObservable` is a pipeline that transform an input observable
/// to an output observable.
/// 
/// The input observable is the source that implements `Observable<T>`,
/// and the output observable is itself that implements `Observable<R>`.
/// 
/// ```dart
/// abstract class PipeObservable<T, R> implements Observable<R> {
/// 
///   const PipeObservable({
///     required this.source,
///   });
/// 
///   final Observable<T> source;
/// }
/// ``` 
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

abstract class MultiSourcePipeObservable<T, R> implements Observable<R> {

  const MultiSourcePipeObservable({
    required this.sources,
  });
  
  final List<Observable<T>> sources; 
}