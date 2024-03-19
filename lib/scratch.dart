// import 'dart:io';

// import 'package:geolocator/geolocator.dart';

void callFuture() async {
  Future.delayed(
    Duration(seconds: 2),
    () {
      print('Hello');
    },
  );
}

// void getLocation() async {
//   Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.lowest);
//   print(position);
// }

void main() {
  callFuture();
  // getLocation();
}
