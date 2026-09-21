import 'dart:convert';


import 'weather.dart';
import 'package:http/http.dart' as http;
class WeatherService{
  static const String _apiKey = String.fromEnvironment("apiKey");
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather> fetchWeather(String city) async{
    final uri = Uri.parse('$_baseUrl?q=$city&appid=$_apiKey&units=metric');
    final response = await http.get(uri);

    if(response.statusCode==200){
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return Weather.fromJSON(json);

    }else if (response.statusCode == 404) {
      throw Exception('City not found');
    } else {
      throw Exception('Failed to load weather (${response.statusCode})');
    }
  }
}