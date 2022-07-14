
import 'dart:async';
import 'package:meta/meta.dart';

import '../scopes/configurable_scope.dart';
import '../shared/build_scope.dart';
import 'configurable.dart';

abstract class ConfigurableCombine implements Configurable {

  const ConfigurableCombine();

  @internal
  const factory ConfigurableCombine.impl({
    required List<Configurable> children,
  }) = _ConfigurableCombineImpl;

  List<Configurable> combine();

  @override
  FutureOr<void> configure(ConfigurableScope scope) {
    final configure = combine();
    return configureScope(configure, scope);
  }
}

class _ConfigurableCombineImpl extends ConfigurableCombine {

  const _ConfigurableCombineImpl ({
    required List<Configurable> children,
  }): _children = children;

  final List<Configurable> _children;

  @override
  List<Configurable> combine() {
    return _children;
  }
}
