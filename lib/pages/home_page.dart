import 'package:first_project/models/weather_model.dart';
import 'package:first_project/pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/weather_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchPage();
                    },
                  ),
                );
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[300]!,
                  weatherData!.getThemeColor()[100]!,
                ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context).cityName!,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Update at :${weatherData!.date}',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text(
                        '${weatherData!.temp.toInt()}',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text(
                            'Max Temp :${weatherData!.maxTemp.toInt()}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Min Temp : ${weatherData!.minTemp.toInt()}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    weatherData!.weatherStateName,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 6,
                  ),
                ],
              ),
            ),
    );
  }
}
