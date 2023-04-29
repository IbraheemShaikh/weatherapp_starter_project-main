import 'dart:convert';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/Api/api_key.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/weather/weather_data_daily.dart';
import 'package:weatherapp_starter_project/weather/weather_data_hourly.dart';
import '../utils/Api_url.dart';
import '../weather/weatherdata.dart';
import 'package:weatherapp_starter_project/weather/weather_data_current.dart';

class Fetchweatherapi {
  WeatherData? weatherdata;

  Future<WeatherData> getapidata(lat, lon) async {
    var res = await http.get(Uri.parse(apiurl(lat, lon)));
    var jsonString = jsonDecode(res.body);
    weatherdata = WeatherData(
        weatherDataCurrent.fromjson(jsonString),
        weatherDataHourly.fromjson(jsonString),
        weatherDataDaily.fromjson(jsonString));
    return weatherdata!;
  }
}
