/// `AsyncStatus` represent the status of asynchronous data.
enum AsyncStatus {
  loading,  /// loading the data.
  loaded,   /// data has been loaded.
  error,    /// failed to load data.
}

/// `Async<T>` represent data in its asynchronous form.
class Async<T> {

  /// Create async data with loading status.
  const Async.loading({
    T? data,
  }): this(
    status: AsyncStatus.loading,
    data: data,
  );

  /// Create async data with loaded status.
  const Async.loaded({
    required T? data,
  }): this(
    status: AsyncStatus.loaded,
    data: data,
  );

  /// Create async data with error status.
  const Async.error({
    T? data,
    required Object error,
    StackTrace stackTrace = StackTrace.empty,
  }): this(
    status: AsyncStatus.error,
    data: data,
    error: error,
    stackTrace: stackTrace,
  );

  /// Create async data with its raw fields:
  /// status, data, error and stackTrace.
  const Async({
    required this.status,
    this.data,
    this.error,
    this.stackTrace,
  });

  /// Current asynchronous status.
  final AsyncStatus status;

  /// The underlining data.
  final T? data;

  /// The error raised when resolving the data.
  final Object? error;

  /// The stackTrace associated with error.
  final StackTrace? stackTrace;

  /// Get underlining data and assert it's not null.
  T get requireData => data!;

  /// Get error and assert it's not null.
  Object get requireError => error!;

  @override
  bool operator==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is Async<T>
      && status == other.status
      && data == other.data
      && error == other.error
      && stackTrace == other.stackTrace;
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    status,
    data,
    error,
    stackTrace,
  ]);

  @override
  String toString() {
    return 'Async<$T>(status: $status, data: $data, error: $error, stackTrace: $stackTrace)';
  }
}
