
class ScopeValueNotExposedError<T> extends Error {

  ScopeValueNotExposedError(Object? name): _name = name;

  final Object? _name;

  @override
  String toString() {
    final header = _name == null ? '$T' : '$T $_name';
    return '`$header` is not exposed in current scope';
  }
}
