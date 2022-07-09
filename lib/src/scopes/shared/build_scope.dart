
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
      return result.catchError(
        (error, stackTrace) {
          scope.dispose();
          return Future.error(error, stackTrace);
        }
      );
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
    final _this = this;
    if (_this is Future<T>) {
      return _this.then(onValue);
    } else {
      return onValue(_this);
    }
  }
}
