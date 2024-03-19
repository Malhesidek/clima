import 'package:geolocator/geolocator.dart';

class Location {
  double? _latitude;
  double? _longitude;

  Future<void> getLocation() async {
    Position? position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      // print(position);
      _latitude = position.latitude;
      _longitude = position.longitude;
    } on Exception catch (e) {
      print(e);
    }
  }

  double? getLatitude() {
    return _latitude;
  }

  double? getLongitude() {
    return _longitude;
  }
}
