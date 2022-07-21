
import 'package:meta/meta.dart';

import '../shared/build_scope.dart';
import 'configurable.dart';
import 'configurable_compose.dart';

abstract class ConfigurableCombine extends ConfigurableCompose {

  const ConfigurableCombine();

  @internal
  const factory ConfigurableCombine.impl({
    required List<Configurable> configurables,
  }) = _ConfigurableCombineImpl;

  List<Configurable> combine();

  @override
  Configurable build() {
    final configure = combine();
    return _combineConfigure(configure);
  }
}

Configurable _combineConfigure(List<Configurable> configure) {
  return Configurable((scope) => configureScope(configure, scope));
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
