import 'dart:async';

import '../scopes/configurable_scope.dart';

abstract class Configurable {
  FutureOr<void> configure(ConfigurableScope scope);
}

