
import 'package:typedef_foundation/typedef_foundation.dart';

import '../scope_methods/scope_expose.dart';
import '../scope_methods/scope_get.dart';

typedef DisposeValue<T> = void Function(T);
typedef ValueExpose<T> = void Function(ScopeExpose scope, Getter<T> getValue);
typedef Equal<T> = T Function(ScopeGet scope);
