
import 'dart:async';
import 'package:meta/meta.dart';

import '../scopes/configurable_scope.dart';
import 'configurable.dart';

@experimental
abstract class ConfigurableCompose implements Configurable {

  const ConfigurableCompose();

  Configurable build();

  @override
  FutureOr<void> configure(ConfigurableScope scope) {
    return build()
      .configure(scope);
  }
}
