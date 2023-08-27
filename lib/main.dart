import 'package:first_project/pages/home_page.dart';
import 'package:first_project/provider/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null
            ? Colors.blue
            : Provider.of<WeatherProvider>(context)
                .weatherData!
                .getThemeColor(),
      ),
      home: HomePage(),
    );
  }
}
