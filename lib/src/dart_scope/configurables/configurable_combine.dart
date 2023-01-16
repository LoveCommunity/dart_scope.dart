
import 'dart:async';
import 'package:meta/meta.dart';

import '../scopes/configurable_scope.dart';
import '../shared/build_scope.dart';
import 'configurable.dart';

/// Combine multiple `Configurable`s into one `Configurable`.
/// 
/// `ConfigurableCombine` is used to compose/combine configurables:
/// 
/// ```dart
/// class AppConfigurables extends ConfigurableCombine {
///   
///   @override
///   List<Configurable> combine() {
///     return [
///       Final<Repository>(equal: (scope) => Repository()),
///       Final<AppNotifier>(equal: (scope) => AppNotifier(
///         repository: scope.get<Repository>(),
///       )),
///     ];  
///   }
/// }
/// ```
/// 
/// Then, it can be used as:
/// 
/// ```dart
/// final scope = await Scope.root([
///   AppConfigurables(),
/// ]);
/// 
/// final repository = scope.get<Repository>();
/// final appNotifier = scope.get<AppNotifier>();
/// ```
/// 
abstract class ConfigurableCombine implements Configurable {

  /// Enable const constructor for subclasses
  const ConfigurableCombine();

  @internal
  const factory ConfigurableCombine.impl({
    required List<Configurable> configurables,
  }) = _ConfigurableCombineImpl;

  /// Combine multiple `Configurable` into one configurable.
  List<Configurable> combine();

  @override
  FutureOr<void> configure(ConfigurableScope scope) {
    final configure = combine();
    return configureScope(configure, scope);
  }
}

class _ConfigurableCombineImpl extends ConfigurableCombine {

  const _ConfigurableCombineImpl ({
    required List<Configurable> configurables,
  }): _configurables = configurables;

  final List<Configurable> _configurables;

  @override
  List<Configurable> combine() {
    return _configurables;
  }
}
