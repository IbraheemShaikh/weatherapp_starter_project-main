import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/customs_colors.dart';
import '../weather/weather_data_current.dart';

class Currentweather extends StatelessWidget {
  final weatherDataCurrent weatherrdatacurrent;
  const Currentweather({super.key, required this.weatherrdatacurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tempraturdatawidget(),
        SizedBox(
          height: 23,
        ),
        currentweathermoredetailwidget()
      ],
    );
  }

  Widget tempraturdatawidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weatherrdatacurrent.current.weather![0].icon}.png",
          height: 80,
          width: 80,
        ),
        Container(
          height: 20,
          width: 1,
          color: Customcolors.dividerLine,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "${weatherrdatacurrent.current.temp!.toInt()}°",
              style: const TextStyle(
                  color: Customcolors.textcolorBlack,
                  fontSize: 68,
                  fontWeight: FontWeight.w600)),
          TextSpan(
              text: "${weatherrdatacurrent.current.weather![0].description}",
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400))
        ])),
      ],
    );
  }

  Widget currentweathermoredetailwidget() {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          height: 60,
          width: 60,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset("assets/icons/windspeed.png"),
        ),
        Container(
          height: 60,
          width: 60,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset("assets/icons/clouds.png"),
        ),
        Container(
          height: 60,
          width: 60,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset("assets/icons/humidity.png"),
        )
      ]),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "${weatherrdatacurrent.current.windSpeed}km/h",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "${weatherrdatacurrent.current.clouds}%",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "${weatherrdatacurrent.current.humidity}%",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          )
        ],
      )
    ]);
  }
}
