import 'package:flutter/material.dart';
import 'package:weather_app/data/loader.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  String cityName;
  LoadingPage({required this.cityName});

  @override
  State<LoadingPage> createState() => _LoadingPageState(cityName);
}

class _LoadingPageState extends State<LoadingPage> {
  bool isLoading = true;
  String cityName;
  _LoadingPageState(this.cityName);

  void startApp() async {
    MyLoader obj = MyLoader(location: cityName);
    await obj.loadData();
    setState(() {
      isLoading = false;
    });
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/home",
          arguments: {
            'temp': obj.temp,
            'humidity': obj.humidity,
            'air_speed': obj.air_speed,
            'description': obj.description,
            'main': obj.main,
            'icon': obj.weather_icon,
            'city': obj.location
          } as Map<String, dynamic>);
    });
  }

  @override
  void initState() {
    startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          child: Column(children: [
            Image.asset(
              "assets/images/weather_logo.jpg",
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Weather App",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            SpinKitWave(
              color: Colors.white,
              size: 35.0,
            ),
          ]),
        ),
        Text(
          "Developed by Parth Parmar",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ]),
    ));
  }
}
