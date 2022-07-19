import 'dart:async';

Future<void> delayed(int mills) {
  return Future<void>.delayed(Duration(milliseconds: mills));
}
