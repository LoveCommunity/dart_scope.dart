
import 'dart:async';

import '../configurables/configurable.dart';
import '../scopes/scope.dart';

/// `ScopePush` is an interface that expose a `scope.push` method.
abstract class ScopePush {

  /// Use `scope.push(...)` to create a new child scope. 
  /// Child scope inherited getters from parent:
  /// 
  /// ```dart
  /// Future<void> scopePushExample() async {
  ///   final rootScope = await Scope.root([
  ///     Final<Repository>(equal: (scope) => Repository()),
  ///     Final<AppNotifier>(equal: (scope) => AppNotifier(
  ///       repository: scope.get<Repository>(),
  ///     )),
  ///   ]);
  /// 
  ///   // create child scope
  ///   final childScope = await rootScope.push([
  ///     Final<AddTodoNotifier>(equal: (scope) => AddTodoNotifier()),
  ///   ]);
  /// 
  ///   // resolve instances in child scope
  ///   final myRepository = childScope.get<Repository>();
  ///   final myAppNotifier = childScope.get<AppNotifier>();
  ///   final myAddTodoNotifier = childScope.get<AddTodoNotifier>();
  /// }
  /// ```
  /// 
  /// Which simulates:
  /// 
  /// ```dart
  /// void rootScope() {                                                    
  ///   final Repository repository = Repository();
  ///   final AppNotifier appNotifier = AppNotifier(
  ///     repository: repository,
  ///   ); 
  /// 
  ///   void childScope() {
  ///     final AddTodoNotifier addTodoNotifier = AddTodoNotifier();
  /// 
  ///     // resolve instances:
  ///     //  `repository`      is inherited from parent scope
  ///     //  `appNotifier`     is inherited from parent scope
  ///     //  `addTodoNotifier` is exposed in current scope
  ///     final myRepository = repository; 
  ///     final myAppNotifier = appNotifier;
  ///     final myAddTodoNotifier = addTodoNotifier;
  ///   }
  /// }
  /// ```
  /// 
  FutureOr<Scope> push(List<Configurable> configure);
}
