import 'dart:async';

Future<T> delayed<T>(int mills, [FutureOr<T> Function()? computation]) {
  return Future<T>.delayed(Duration(milliseconds: mills), computation);
}
