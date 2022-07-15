
import 'dart:async';

import '../scopes/configurable_scope.dart';
import 'configurable.dart';

abstract class ConfigurableCompose implements Configurable {

  Configurable build();

  @override
  FutureOr<void> configure(ConfigurableScope scope) {
    return build()
      .configure(scope);
  }
}
