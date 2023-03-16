import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherfucntionality/services/weather.dart';

class LoadingScreen extends StatefulWidget
{
  const LoadingScreen({super.key});
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocationData() async
  {
    var getData =  await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(locationWeather: getData,)));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.blue,
          size: 200,
        ),
      )
    );
  }
}

