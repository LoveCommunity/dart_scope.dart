
import 'package:typedef_foundation/typedef_foundation.dart';

abstract class ScopeExpose {
  void expose<T>({
    Object? name,
    required Getter<T> expose,
  });
}
