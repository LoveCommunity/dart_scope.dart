
import 'dart:async';
import 'package:meta/meta.dart';

import '../configurables/configurable.dart';
import '../scopes/configurable_scope.dart';
import '../scopes/scope.dart';

@internal
FutureOr<Scope> buildScope(List<Configurable> configure, ConfigurableScope scope) {
  return configureScope(configure, scope)
    .then((_) => scope);
}

@internal
FutureOr<void> configureScope(List<Configurable> configure, ConfigurableScope scope) {
  return configure
    .fold<FutureOr<void>>(null, (futureOrVoid, configurable) {
      return futureOrVoid.then((_) => configurable.configure(scope));
    });
}

extension <T> on FutureOr<T> {

  FutureOr<R> then<R>(
    FutureOr<R> Function(T) onValue, {
    FutureOr<R> Function(Object error, StackTrace stackTrace)? onError,
  }) {
    final _this = this;
    if (_this is Future<T>) {
      return _this.then(onValue, onError: onError);
    } else {
      return onValue(_this);
    }
  }
}
