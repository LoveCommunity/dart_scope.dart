import 'dart:async';
import 'package:typedef_foundation/typedef_foundation.dart';

import '../scopes/configurable_scope.dart';
import '../shared/expose_in_scope.dart';
import '../shared/typedefs.dart';

import 'configurable.dart';

/// `Final` is configuration simulate assignment using 
/// `(late) final` keyword.
/// 
class Final<T> implements Configurable {

  /// Assign an instance and exposing it in current scope.
  ///
  /// So:
  /// ```dart
  /// final rootScope = await Scope.root([
  ///   Final<StreamController<String>>(
  ///     name: 'controller', 
  ///     equal: (scope) => StreamController(),
  ///   ),
  /// ]);
  /// ```
  /// 
  /// Simulate:
  /// ```dart
  /// void rootScope() async {
  ///   final StreamController<String> controller = StreamController();
  /// }
  /// ``` 
  /// 
  /// Use `expose` parameter to override default exposing behavior:
  /// 
  /// ```dart
  /// final rootScope = await Scope.root([
  ///   Final<StreamController<String>>(
  ///     equal: (scope) => StreamController(),
  ///     expose: (scope, getStreamController) {
  ///       // Instead of exposing the whole `StreamController`, 
  ///       // We can only expose it's stream field here.
  ///       scope.expose<Stream<String>>(
  ///         expose: () => getStreamController().stream,
  ///       );
  ///     },
  ///   )
  /// ]);
  /// 
  /// print(rootScope.has<StreamController<String>>()); // false
  /// print(rootScope.has<Stream<String>>());           // true
  /// ```
  /// 
  /// Use `dispose` parameter to register dispose logic:
  /// 
  /// ```dart
  /// final rootScope = await Scope.root([
  ///   Final<StreamController<String>>(
  ///     equal: (scope) => StreamController(),
  ///     dispose: (controller) {
  ///       controller.close();
  ///     },
  ///   ),
  /// ]);
  /// 
  /// // pop scope will close the controller.
  /// rootScope.dispose(); 
  /// ```
  /// 
  const Final({
    Object? name,
    required Equal<T> equal,
    ExposeValue<T>? expose,
    DisposeValue<T>? dispose,
    bool lazy = true,
  }): _name = name,
    _equal = equal,
    _expose = expose,
    _dispose = dispose,
    _lazy = lazy;
  
  final Object? _name;
  final Equal<T> _equal;
  final ExposeValue<T>? _expose;
  final DisposeValue<T>? _dispose;
  final bool _lazy;

  @override
  FutureOr<void> configure(ConfigurableScope scope) {

    final Getter<T> getValue;
    if (!_lazy) {
      final value = _equal(scope);
      getValue = () => value;
    } else {
      late final value = _equal(scope);
      getValue = () => value;
    }
    
    exposeInScope(
      scope: scope,
      name: _name,
      getValue: getValue,
      expose: _expose,
      dispose: _dispose,
    );
  }
}

