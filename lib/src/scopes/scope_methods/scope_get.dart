import '../errors/scope_value_not_exposed_error.dart';

abstract class ScopeGet {
  T? getOrNull<T>({
    Object? name,
  });
  bool has<T>({
    Object? name,
  });
}

extension ScopeGetX on ScopeGet {

  T get<T>({
    Object? name,
  }) => has<T>(name: name)
    ? getOrNull<T>(name: name) as T
    : throw ScopeValueNotExposedError<T>(name);
}
