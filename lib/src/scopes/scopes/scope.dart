
import 'dart:async';
import 'package:disposal/disposal.dart';

import '../configurables/configurable.dart';
import '../scope_methods/scope_get.dart';
import '../scope_methods/scope_push.dart';
import '../shared/build_scope.dart';

import 'configurable_scope.dart';

abstract class Scope implements ScopeGet, ScopePush, Disposable {
  static FutureOr<Scope> root(List<Configurable> configure) => _scopeRoot(configure);
}

FutureOr<Scope> _scopeRoot(List<Configurable> configure) => buildScope(configure, ConfigurableScope());
