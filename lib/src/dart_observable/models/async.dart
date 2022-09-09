
enum AsyncStatus {
  loading,
  loaded,
  error,
}

class Async<T> {

  const Async.loading({
    T? data,
  }): this(
    status: AsyncStatus.loading,
    data: data,
  );

  const Async.loaded({
    required T? data,
  }): this(
    status: AsyncStatus.loaded,
    data: data,
  );

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

  const Async({
    required this.status,
    this.data,
    this.error,
    this.stackTrace,
  });

  final AsyncStatus status;
  final T? data;
  final Object? error;
  final StackTrace? stackTrace;

  T get requireData => data!;
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
