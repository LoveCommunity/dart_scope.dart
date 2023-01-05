import '../errors/scope_value_not_exposed_error.dart';

/// `ScopeGet` is an interface that expose `scope.getOrNull` and `scope.has` methods.
abstract class ScopeGet {

  /// Use `scope.getOrNull<T>(...)` to safely resolve instance. 
  /// This method will return `null` when instance is not exposed:
  /// ```dart
  /// final Repository? repository = scope.getOrNull<Repository>();
  /// ```
  /// 
  /// Provide `name` to resolve instance with specific name:
  /// ```dart
  /// final repository = scope.getOrNull<Repository>(name: 'repository');
  /// ```
  /// 
  T? getOrNull<T>({
    Object? name,
  });
  
  /// Use `scope.has<T>(...)` to check if instance has been exposed:
  /// ```dart
  /// final bool hasRepository = scope.has<Repository>();
  /// ```
  /// 
  /// Provide `name` to check if instance with specific name has been exposed:
  /// ```dart
  /// final hasRepository = scope.has<Repository>(name: 'repository');
  /// ```
  /// 
  bool has<T>({
    Object? name,
  });
}

/// `ScopeGetX` is an extension to `ScopeGet` that adds `scope.get` method.
extension ScopeGetX on ScopeGet {

  /// Use `scope.get<T>(...)` to resolve instance from current scope:
  /// ```dart
  /// final repository = scope.get<Repository>();
  /// ```
  /// 
  /// Provide `name` to resolve instance with specific name:
  /// ```dart
  /// final repository = scope.get<Repository>(name: 'repository');
  /// ```
  /// 
  /// This method will return instance if it's been exposed, 
  /// otherwise throws `ScopeValueNotExposedError` when it's not exposed.
  /// 
  T get<T>({
    Object? name,
  }) => has<T>(name: name)
    ? getOrNull<T>(name: name) as T
    : throw ScopeValueNotExposedError<T>(name);
}
