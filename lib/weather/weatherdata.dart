import 'package:weatherapp_starter_project/weather/weather_data_current.dart';
import 'package:weatherapp_starter_project/weather/weather_data_daily.dart';
import 'package:weatherapp_starter_project/weather/weather_data_hourly.dart';

class WeatherData {
  final weatherDataCurrent? current;
  final weatherDataHourly? hourly;
  final weatherDataDaily? daily;

  WeatherData([this.current, this.hourly, this.daily]);

  weatherDataCurrent getcurrentweather() => current!;
  weatherDataHourly gethourlyweather() => hourly!;
  weatherDataDaily getdailyweather() => daily!;
}
