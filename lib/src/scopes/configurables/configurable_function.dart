
import 'dart:async';
import 'package:meta/meta.dart';

import '../scopes/configurable_scope.dart';
import 'configurable.dart';


@internal
class ConfigurableFunction implements Configurable {

  const ConfigurableFunction(
    ScopeConfigure configure
  ): _configure = configure;
  
  final ScopeConfigure _configure;

  @override
  FutureOr<void> configure(ConfigurableScope scope) {
    return _configure(scope);
  }
}
