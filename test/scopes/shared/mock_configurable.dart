import 'dart:async';
import 'package:scopes/scopes.dart';

class MockConfigurable implements Configurable {
  MockConfigurable(this._configure);

  final FutureOr<void> Function(ConfigurableScope scope) _configure;

  @override
  FutureOr<void> configure(ConfigurableScope scope) {
    return _configure(scope);
  }
}
