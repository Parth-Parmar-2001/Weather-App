import 'package:flutter/material.dart';

// Importing Routes
import 'routes/weather_app.dart';
import 'routes/loading_page.dart';
import 'routes/location_page.dart';

void main() {
  runApp(MaterialApp(
    home: LoadingPage(cityName: "Ahmedabad"),
    debugShowCheckedModeBanner: false,
    routes: {
      "/home": (context) => WeatherApp(),
      // "/loading": (context) => LoadingPage(cityName: Search,),
      "/location": (context) => LocationPage()
    },
    theme: ThemeData(
      primaryColor: Colors.blue[900]
    ),
  ));
}
