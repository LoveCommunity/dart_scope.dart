
import 'package:typedef_foundation/typedef_foundation.dart';

import '../scope_methods/scope_expose.dart';
import '../scope_methods/scope_get.dart';

/// `DisposeValue` is a function describe how to dispose a value.
typedef DisposeValue<T> = void Function(T);

/// `ExposeValue` is a function describe how to expose a value.
typedef ExposeValue<T> = void Function(ScopeExpose scope, Getter<T> getValue);

/// `Equal` is a function describe how to resolve a value,
/// this value can be assigned then.
typedef Equal<T> = T Function(ScopeGet scope);
