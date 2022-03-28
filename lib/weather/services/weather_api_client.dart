// to start call some http request
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class WeatherApiClient{
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=84502356fe0def577613e9f74a8573e8&units=metric");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);

  }
}