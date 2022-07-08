
import 'package:meta/meta.dart';
import 'package:typedef_foundation/typedef_foundation.dart';

import '../scope_methods/disposable_sink.dart';
import '../scopes/configurable_scope.dart';
import 'typedefs.dart';

@internal
void exposeInScope<T>({
  required ConfigurableScope scope,
  required Object? name,
  required Getter<T> getter,
  required InstanceExpose<T>? expose,
  required InstanceDispose<T>? dispose,
}) {
  if (expose != null) {
    expose(scope, getter);
  } else {
    scope.expose<T>(name: name, expose: getter);
  }

  if (dispose != null) {
    scope.addDispose(() {
      dispose(getter());
    });
  }
}
