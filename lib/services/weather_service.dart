import 'dart:convert';

import 'package:first_project/models/weather_model.dart';
import 'package:http/http.dart' as http;

String baseUrl = 'http://api.weatherapi.com/v1';
String apiKey = '0d9e3fcd89324396a0462625232208';

class WeatherService {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }

    return weather;
  }
}
