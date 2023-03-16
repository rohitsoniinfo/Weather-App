import 'package:flutter/material.dart';
import 'package:weatherfucntionality/utilities/constants.dart';
import 'package:weatherfucntionality/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}
class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temp = 0;
  int condition = 0;
  String cityName = '';
  String weatherIcon = '';
  String tempMsg = '';

  void updateUI(dynamic locationWeather) {
    setState(() {
      if (locationWeather == null) {
        temp = 0;
        tempMsg = "can't get the weather data.";
        condition = 0;
        weatherIcon = '';
        cityName = '';
        return;
      }
      temp = locationWeather['main']['temp'].toInt();
      tempMsg = weather.getMessage(temp);
      condition = locationWeather['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = locationWeather['name'];
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var updatedWeatherData = await weather.getLocationWeather();
                        updateUI(updatedWeatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context, MaterialPageRoute(builder: (context) => CityScreen()),);
                      var cityWeather = await weather.getCityWeather(typedName);
                      updateUI(cityWeather);
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      //☀
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "$tempMsg in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}