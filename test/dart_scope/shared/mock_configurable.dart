import 'dart:async';
import 'package:dart_scope/dart_scope.dart';

class MockConfigurable implements Configurable {
  MockConfigurable(this._configure);

  final FutureOr<void> Function(ConfigurableScope scope) _configure;

  @override
  FutureOr<void> configure(ConfigurableScope scope) {
    return _configure(scope);
  }
}
