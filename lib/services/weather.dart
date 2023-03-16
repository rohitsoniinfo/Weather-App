import 'package:weatherfucntionality/services/location.dart';
import 'package:weatherfucntionality/services/networking.dart';
String websiteUrl = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = '5125016fd676c8966ecc432316e30229';

class WeatherModel {
   Future<dynamic> getCityWeather(String cityName) async
  {
    String url = '$websiteUrl?q=$cityName&appid=$apiKey&units=metric'; //https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    NetworkHelper cityWeather = NetworkHelper(url);
    var cityWeatherData = await cityWeather.getData();
    return cityWeatherData;
  }

  Future<dynamic> getLocationWeather() async
  {
    Location location=Location();
    await location.getCurrentLocation();
    String url = '$websiteUrl?lat=${location.lat}&lon=${location.long}&appid=$apiKey&units=metric';
    NetworkHelper networkhelper = NetworkHelper(url);
    var getData = await networkhelper.getData();
    return getData;
  }

  String getWeatherIcon(int condition) {
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

  String getMessage(int temp) {
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
