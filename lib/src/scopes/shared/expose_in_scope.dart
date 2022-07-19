
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
  required ValueExpose<T>? expose,
  required ValueDispose<T>? dispose,
}) {

  final instanceExpose = expose ?? defaultExpose(name);
  instanceExpose(scope, getter);

  if (dispose != null) {
    scope.addDispose(() {
      dispose(getter());
    });
  }
}

@internal 
ValueExpose<T> defaultExpose<T>(Object? name) {
  return (scope, getter) {
    scope.expose<T>(name: name, expose: getter);
  };
}
