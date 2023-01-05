
import 'package:typedef_foundation/typedef_foundation.dart';

/// `ScopeExpose` is an interface that expose `scope.expose` method.
abstract class ScopeExpose {

  /// Use `scope.expose<T>(...)` to expose instance within current scope, 
  /// this instance can be resolved later:
  /// ```dart
  /// final rootScope = await Scope.root([
  ///   Configurable((scope) {
  ///     final repository = Repository();
  ///     // expose repository
  ///     scope.expose<Repository>( 
  ///       expose: () => repository,
  ///     );
  ///   })
  /// ]);
  /// 
  /// // resolve repository
  /// final repository = rootScope.get<Repository>();
  /// ```
  /// 
  /// Provide `name` to expose instance with specific name:
  /// ```dart
  /// scope.expose<Repository>(
  ///   name: 'repository',
  ///   expose: () => repository,
  /// );
  /// ```
  /// 
  void expose<T>({
    Object? name,
    required Getter<T> expose,
  });
}
