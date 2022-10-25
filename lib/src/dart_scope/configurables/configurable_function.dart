
import 'dart:async';
import 'package:meta/meta.dart';

import '../scopes/configurable_scope.dart';
import 'configurable.dart';


@internal
class ConfigurableFunction implements Configurable {

  const ConfigurableFunction(
    ConfigureScope configure
  ): _configure = configure;
  
  final ConfigureScope _configure;

  @override
  FutureOr<void> configure(ConfigurableScope scope) {
    return _configure(scope);
  }
}
