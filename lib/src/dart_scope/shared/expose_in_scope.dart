
import 'package:meta/meta.dart';
import 'package:typedef_foundation/typedef_foundation.dart';

import '../scope_methods/disposable_sink.dart';
import '../scopes/configurable_scope.dart';
import 'typedefs.dart';

@internal
void exposeInScope<T>({
  required ConfigurableScope scope,
  required Object? name,
  required Getter<T> getValue,
  required ExposeValue<T>? expose,
  required DisposeValue<T>? dispose,
}) {

  final valueExpose = expose ?? defaultExpose(name);
  valueExpose(scope, getValue);

  if (dispose != null) {
    scope.addDispose(() {
      dispose(getValue());
    });
  }
}

@internal 
ExposeValue<T> defaultExpose<T>(Object? name) {
  return (scope, getValue) {
    scope.expose<T>(name: name, expose: getValue);
  };
}
