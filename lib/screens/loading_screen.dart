import 'package:clima/screens/city_screen.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.open-meteo.com/v1/forecast?latitude=${location.getLatitude()}&longitude=${location.getLongitude()}&current=temperature_2m&hourly=temperature_2m&forecast_days=1');
    var weatherData = await networkHelper.getData();
    print(weatherData);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LocationScreen()));
    // print(
    //     "Latitude: ${location.getLatitude()}, longitude: ${location.getLongitude()}");
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
