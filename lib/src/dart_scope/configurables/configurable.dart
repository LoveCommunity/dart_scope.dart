import 'dart:async';

import '../scopes/configurable_scope.dart';
import 'configurable_combine.dart';
import 'configurable_function.dart';

typedef ConfigureScope = FutureOr<void> Function(ConfigurableScope scope);

abstract class Configurable {
  FutureOr<void> configure(ConfigurableScope scope);

  const factory Configurable(ConfigureScope configure) = ConfigurableFunction;
  const factory Configurable.combine({
    required List<Configurable> configurables,
  }) = ConfigurableCombine.impl;
}

