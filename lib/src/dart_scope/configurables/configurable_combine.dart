
import 'dart:async';
import 'package:meta/meta.dart';

import '../scopes/configurable_scope.dart';
import '../shared/build_scope.dart';
import 'configurable.dart';

abstract class ConfigurableCombine implements Configurable {

  const ConfigurableCombine();

  @internal
  const factory ConfigurableCombine.impl({
    required List<Configurable> configurables,
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
    required List<Configurable> configurables,
  }): _configurables = configurables;

  final List<Configurable> _configurables;

  @override
  List<Configurable> combine() {
    return _configurables;
  }
}
