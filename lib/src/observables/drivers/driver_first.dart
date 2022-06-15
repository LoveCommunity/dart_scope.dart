
import 'package:meta/meta.dart';

import '../../shared/value.dart';
import '../errors/driver_latest_value_not_replay_error.dart';
import 'driver.dart';

@internal
T driverFirst<T>(Driver<T> driver) {
  Value<T>? result;
  driver.drive((data) {
    if (result == null) {
      result = Value(data);
    }
  })
  .dispose();
  if (result == null) {
    throw DriverLatestValueNotReplayError(driver);
  }
  return result!.value;
}
