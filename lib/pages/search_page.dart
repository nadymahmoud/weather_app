import 'package:first_project/models/weather_model.dart';
import 'package:first_project/provider/weather_provider.dart';
import 'package:first_project/services/weather_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search a City')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              border: OutlineInputBorder(),
              label: Text('Search'),
              hintText: 'Enter Sity Name',
              suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherService service = WeatherService();
                    WeatherModel? weather =
                        await service.getWeather(cityName: cityName!);
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weather;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;

                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}
