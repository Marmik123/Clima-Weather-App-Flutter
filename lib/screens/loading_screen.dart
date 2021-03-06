import 'dart:convert';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const  apikey= "03d374d476defde35e6b0eb4a5b6cbf5";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  void getLocationData() async {


    var weatherData= await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context){
          return LocationScreen(locationWeather: weatherData);
    }));

  }

  @override
  Widget build(BuildContext context) {
    print('build is called');
    return Scaffold(
      body:SpinKitFadingCube(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
