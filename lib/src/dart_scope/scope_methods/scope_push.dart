
import 'dart:async';

import '../configurables/configurable.dart';
import '../scopes/scope.dart';

abstract class ScopePush {
  FutureOr<Scope> push(List<Configurable> configure);
}
