
import 'dart:async';

import '../configurables/configurable.dart';
import '../scope_methods/scope_get.dart';
import '../shared/build_scope.dart';

import 'configurable_scope.dart';

abstract class Scope implements ScopeGet {
  static FutureOr<Scope> root(List<Configurable> configure) => _scopeRoot(configure);
}

FutureOr<Scope> _scopeRoot(List<Configurable> configure) => buildScope(configure, ConfigurableScope());
