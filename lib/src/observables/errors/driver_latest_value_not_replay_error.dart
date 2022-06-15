
import '../drivers/driver.dart';

class DriverLatestValueNotReplayError<T> extends Error {

  DriverLatestValueNotReplayError(this._driver);

  final Driver<T> _driver;

  @override
  String toString() {
    return '$_driver should replay latest value synchronousy when observed';
  }
}
