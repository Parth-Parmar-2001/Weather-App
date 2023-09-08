import 'package:http/http.dart';
import 'dart:convert';

class MyLoader {
  Map<String, dynamic> data = {};
  bool isLoading = true;

  String temp = "";
  String description = "";
  String air_speed = "";
  String humidity = "";
  String main = "";
  String weather_icon = "";

  String location;
  MyLoader({required this.location});

  Future<void> loadData() async {
    Response response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=7a7234611668e253dcfc9eb63c686eb2"));
    data = jsonDecode(response.body);
    print(data.keys);

    // double raw_temp = data['main']['temp'] - 273.15;
    // double raw_air_speed = data['wind']['speed'] / 0.277777777777778;

    temp = (data['main']['temp'] - 273.15).toString(); // celcius
    description = (data['weather'][0]['description']).toString();
    air_speed = (data['wind']['speed'] / 0.277777777777778).toString(); // km/h
    humidity = (data['main']['humidity']).toString(); // percentage
    main = (data['weather'][0]['main']);
    weather_icon = data['weather'][0]['icon'];
  }
}

// MyLoader obj = MyLoader(location: "Mumbai");

