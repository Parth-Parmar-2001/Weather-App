import 'package:flutter/material.dart';
import 'package:weather_app/routes/loading_page.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  var myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final filtered_data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final icon = filtered_data['icon'];
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blue[200],
          resizeToAvoidBottomInset: false,
          body: Container(
            margin: EdgeInsets.all(16.0),
            child: Column(children: [
              Container(
                padding: EdgeInsets.only(
                    left: 16.0, right: 8.0, top: 2, bottom: 2.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Row(children: [
                  Expanded(
                      child: TextField(
                    controller: myController,
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                        hintText: "Search for Your City...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  )),
                  IconButton(
                    onPressed: () {
                      String myCityName = myController.text;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoadingPage(
                              cityName: myCityName,
                            ),
                          ));
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    iconSize: 24,
                    visualDensity: VisualDensity.compact,
                  )
                ]),
              ),
              SizedBox(
                height: 8,
              ),
              Card(
                // color: Color.fromARGB(255, 214, 241, 255),
                color: Colors.blue[900],
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                elevation: 5,
                child: Container(
                  height: 135,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 0.0),
                          decoration: BoxDecoration(
                              color: Colors.blue[400],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(800.0))),
                          child: Image.network(
                            "https://openweathermap.org/img/wn/$icon@2x.png",
                          ),
                        ),
                        Text(
                          "${filtered_data['main']} \nin ${filtered_data['city']}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                ),
              ),
              Card(
                color: Colors.blue[900],
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  height: 166,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.thermostat,
                          size: 35,
                          color: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              filtered_data['temp'].toString().substring(0, 4),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 65),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.blue[900],
                      margin: EdgeInsets.only(right: 8.0),
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        height: 162,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.air,
                                size: 25,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          (filtered_data['air_speed']
                                                      .toString()
                                                      .length >
                                                  4)
                                              ? filtered_data['air_speed']
                                                  .toString()
                                                  .substring(0, 4)
                                              : filtered_data['air_speed']
                                                  .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "km/h",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Wind Speed",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      color: Colors.blue[900],
                      margin: EdgeInsets.only(right: 8.0),
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        height: 162,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.water_drop,
                                size: 25,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          filtered_data['humidity'].toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          "%",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Humidity",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 24,
                thickness: 1.5,
                indent: 20,
                endIndent: 20,
                color: Colors.black,
              ),
              Center(
                child: Text(
                  "Developed by Parth Parmar",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              )
            ]),
          )),
    );
  }
}
