import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'fdf9fe80c98a1cca9f17db52257cd502';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  static Future<String> getCityWeather(String cityName) async {
    var url = '${openWeatherMapURL}?q=$cityName&appid=${apiKey}&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  static Future<String> getLocationWeather() async {
    Location location = Location();
    // returns an object with latitude and longitude
    await location.getLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '${openWeatherMapURL}?lat=${location.getLatitude()}&lon=${location.getLongitude()}&appid=${apiKey}&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
