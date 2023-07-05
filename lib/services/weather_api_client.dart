import 'package:http/http.dart' as http;

//to start call some http request in flutter we will need the flutter http package
import 'dart:convert';
import 'package:weather_app/model/weather_model.dart';

class WeatherApiClient{
  Future<Weather>? getCurrentWeather(String? location) async{
    var endpoint = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=ac624965171167360f1db08025919982&units=metric");
    
    var response = await http.get(endpoint);
    print(response.body);
    var body = jsonDecode(response.body);
    print(Weather.fromJson(body).cityName);
    //or we can just do this
    return Weather.fromJson(body);
  }
}