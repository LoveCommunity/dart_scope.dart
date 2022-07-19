
import 'package:typedef_foundation/typedef_foundation.dart';

import '../scope_methods/scope_expose.dart';
import '../scope_methods/scope_get.dart';

typedef ValueDispose<T> = void Function(T);
typedef InstanceExpose<T> = void Function(ScopeExpose scope, Getter<T> getter);
typedef Equal<T> = T Function(ScopeGet scope);
