import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:weatherapp_starter_project/controllers/global_controller.dart';
import 'package:weatherapp_starter_project/utils/customs_colors.dart';

import '../widgets/Comfortable.dart';
import '../widgets/current_weather.dart';
import '../widgets/header_widget.dart';
import '../widgets/hourly_data_widget.dart';
import '../widgets/weather_data_forcast.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final Globalcontroller globalController =
      Get.put(Globalcontroller(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? Center(
                child: Image.asset(
                "assets/icons/weather.png",
                height: 200,
                width: 200,
              ))
            : Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Headerwidget(),
                    Currentweather(
                        weatherrdatacurrent:
                            globalController.getdata().getcurrentweather()),
                    Hourlydatawidget(
                        weaatherDataHourly:
                            globalController.getdata().gethourlyweather()),
                    WeatherDataForcast(
                      Weatherdatadaily:
                          globalController.getdata().getdailyweather(),
                    ),
                    Container(
                      height: 1,
                      color: Customcolors.dividerLine,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Comfortablewidget(
                        WeatherDataCurrent:
                            globalController.getdata().getcurrentweather()),
                  ],
                ),
              )),
      ),
    );
  }
}
