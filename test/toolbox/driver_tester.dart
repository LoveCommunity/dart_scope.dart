
import 'package:scopes/scopes.dart';

class DriverTester<T> {

  DriverTester(this._driver);

  final Driver<T> _driver;

  final List<T> recorded = [];

  Disposable? _observation;

  void startDrive() {
    _observation = _driver.drive(recorded.add);
  }

  void stopDrive() {
    _observation?.dispose();
  }
}
