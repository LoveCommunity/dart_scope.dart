
import '../../dart_observable/states/states.dart';

import 'scope_get.dart';

/// `ScopeGetStatesX` is an extension to `ScopeGet`
/// that adds convenience methods like `scope.getStates`, 
/// `scope.getStatesOrNull` and `scope.hasStates`.
extension ScopeGetStatesX on ScopeGet {

  /// Use `scope.getStatesOrNull<T>(...)` to safely resolve states.
  /// 
  /// It is a convenience method for `scope.getOrNull<States<T>>(...)`.
  /// 
  States<T>? getStatesOrNull<T>({
    Object? name,
  }) => getOrNull<States<T>>(name: name);

  /// Use `scope.getStates<T>(...)` to resolve states from current scope.
  /// 
  /// It is a convenience method for `scope.get<States<T>>(...)`.
  /// 
  States<T> getStates<T>({
    Object? name,
  }) => get<States<T>>(name: name);

  /// Use `scope.hasStates<T>(...)` to check if states has been exposed.
  /// 
  /// It is a convenience method for `scope.has<States<T>>(...)`.
  /// 
  bool hasStates<T>({
    Object? name,
  }) => has<States<T>>(name: name);
}