
/// `ScopeValueNotExposedError` is an error indicates the resolving value
///  has not been exposed in current scope.
/// 
/// This may happen in following situations:
///   1. forget to expose value with according name when creating scope
///   2. there are some (parent-child) scopes which may be misused 
/// 
class ScopeValueNotExposedError<T> extends Error {

  /// Create `ScopeValueNotExposedError` with an optional value name. 
  ScopeValueNotExposedError(Object? name): _name = name;

  final Object? _name;

  @override
  String toString() {
    final header = _name == null ? '$T' : '$T $_name';
    return '`$header` is not exposed in current scope';
  }
}
