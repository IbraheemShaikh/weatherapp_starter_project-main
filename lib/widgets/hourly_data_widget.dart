import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/controllers/global_controller.dart';

import '../utils/customs_colors.dart';
import '../weather/weather_data_hourly.dart';

class Hourlydatawidget extends StatelessWidget {
  final weatherDataHourly weaatherDataHourly;
  Hourlydatawidget({super.key, required this.weaatherDataHourly});

  RxInt currentindex = Globalcontroller().gettIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          alignment: Alignment.topCenter,
          child: Text(
            "Today",
            style: TextStyle(fontSize: 18),
          ),
        ),
        hourlylist(),
      ],
    );
  }

  Widget hourlylist() {
    return Container(
      height: 150,
      margin: EdgeInsets.only(top: 5, bottom: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weaatherDataHourly.hourly.length > 12
            ? 12
            : weaatherDataHourly.hourly.length,
        itemBuilder: (context, index) {
          return Obx((() => GestureDetector(
                onTap: () {
                  currentindex.value = index;
                },
                child: Container(
                  width: 85,
                  margin: EdgeInsets.only(left: 20, right: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.5, 0),
                            spreadRadius: 1,
                            blurRadius: 30,
                            color: Customcolors.dividerLine.withAlpha(150))
                      ],
                      gradient: currentindex.value == index
                          ? LinearGradient(colors: [
                              Customcolors.firstgradientcolor,
                              Customcolors.secondgradientcoolor
                            ])
                          : null),
                  child: detailhourlydata(
                    index: index,
                    currentindex: currentindex.toInt(),
                    tempt: weaatherDataHourly.hourly[index].temp!,
                    day: weaatherDataHourly.hourly[index].dt!,
                    weathericon:
                        weaatherDataHourly.hourly[index].weather![0].icon!,
                  ),
                ),
              )));
        },
      ),
    );
  }
}

class detailhourlydata extends StatelessWidget {
  int index;
  int currentindex;
  int tempt;
  int day;
  String weathericon;

  String gettime(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String x = DateFormat("jm").format(time);
    return x;
  }

  detailhourlydata(
      {super.key,
      required this.index,
      required this.currentindex,
      required this.tempt,
      required this.day,
      required this.weathericon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            gettime(day),
            style: TextStyle(
                color: currentindex == index ? Colors.white : Colors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: Image.asset(
            "assets/weather/$weathericon.png",
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Text(
            "$tempt.°",
            style: TextStyle(
                color: currentindex == index ? Colors.white : Colors.black),
          ),
        )
      ],
    );
  }
}
