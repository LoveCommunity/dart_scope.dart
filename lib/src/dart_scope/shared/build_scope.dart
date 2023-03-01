
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
  try {
    final result = configure
      .fold<FutureOr<void>>(null, (futureOrVoid, configurable) {
        return futureOrVoid.then((_) => configurable.configure(scope));
      });
    if (result is Future<void>) {
      final Future<void> autoCleanFuture = () async {
        try {
          await result;
        } catch (_) {
          scope.dispose();
          rethrow;
        }
      }();
      return autoCleanFuture;
    }
  } catch(_) {
    scope.dispose();
    rethrow;
  }
}

extension <T> on FutureOr<T> {

  FutureOr<R> then<R>(
    FutureOr<R> Function(T) onValue
  ) {
    final self = this;
    if (self is Future<T>) {
      return self.then(onValue);
    } else {
      return onValue(self);
    }
  }
}
