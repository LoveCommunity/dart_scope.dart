
import 'package:dart_scope/dart_scope.dart';

States<T> statesJust<T>(T state) => States((setState) {
  setState(state);
  return Disposable.empty;
});
