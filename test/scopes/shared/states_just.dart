
import 'package:scopes/scopes.dart';

States<T> statesJust<T>(T state) => States((setState) {
  setState(state);
  return Disposable.empty;
});
