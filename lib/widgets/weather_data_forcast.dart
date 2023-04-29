import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/utils/customs_colors.dart';
import 'package:weatherapp_starter_project/weather/weather_data_daily.dart';

class WeatherDataForcast extends StatelessWidget {
  String getday(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String x = DateFormat("EEE").format(time);
    return x;
  }

  final weatherDataDaily Weatherdatadaily;
  const WeatherDataForcast({super.key, required this.Weatherdatadaily});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      height: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Customcolors.dividerLine.withAlpha(150)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              "Next Days",
              style:
                  TextStyle(color: Customcolors.textcolorBlack, fontSize: 17),
            ),
          ),
          dailylist(),
        ],
      ),
    );
  }

  Widget dailylist() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: Weatherdatadaily.daily.length > 7
            ? 7
            : Weatherdatadaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                  height: 60,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 80,
                        child: Text(
                          getday(Weatherdatadaily.daily[index].dt),
                          style: TextStyle(
                              color: Customcolors.textcolorBlack, fontSize: 13),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        child: Image.asset(
                            "assets/weather/${Weatherdatadaily.daily[index].weather![0].icon}.png"),
                      ),
                      Text(
                          "${Weatherdatadaily.daily[index].temp!.max}°/${Weatherdatadaily.daily[index].temp!.min}°")
                    ],
                  ))
            ],
          );
        },
      ),
    );
  }
}
