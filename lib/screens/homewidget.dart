import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/weather.dart';

WeatherFactory wf = new WeatherFactory("b0cf899134ff4c7bbb7db58af59d6068",
    language: Language.ENGLISH);

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Weather Bird",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: BodyWidget(),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  String cityName = "Moscow";
  var temp = "--";
  var WeatherDescription = "Press update button";
  Future<void> _getWeather() async {
    Weather w = await wf.currentWeatherByCityName(cityName);
    setState(() {
      temp = w.temperature!.celsius!.toInt().toString();
      WeatherDescription = w.weatherDescription!;
      print(WeatherDescription);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "$cityName",
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              WeatherDescription,
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "$temp °С",
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.black,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                _getWeather();
              },
              child: Text("Update"),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.teal,
                onSurface: Colors.grey,
              ),
            ),
            TextField(
                decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 5.0),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
