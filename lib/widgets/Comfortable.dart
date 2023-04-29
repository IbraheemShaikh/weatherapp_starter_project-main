import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherapp_starter_project/utils/customs_colors.dart';
import 'package:weatherapp_starter_project/weather/weather_data_current.dart';

class Comfortablewidget extends StatelessWidget {
  final weatherDataCurrent WeatherDataCurrent;

  const Comfortablewidget({super.key, required this.WeatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 1, bottom: 20, left: 20, right: 20),
          child: Text(
            "Comfort Level",
            style: TextStyle(color: Customcolors.textcolorBlack, fontSize: 20),
          ),
        ),
        SizedBox(
            height: 180,
            child: Column(
              children: [
                Center(
                  child: SleekCircularSlider(
                    min: 0,
                    max: 100,
                    initialValue:
                        WeatherDataCurrent.current.humidity!.toDouble(),
                    appearance: CircularSliderAppearance(
                        customWidths: CustomSliderWidths(
                            handlerSize: 0,
                            trackWidth: 12,
                            progressBarWidth: 12),
                        infoProperties: InfoProperties(
                            bottomLabelText: "Humidity",
                            bottomLabelStyle: TextStyle(
                              letterSpacing: 0.1,
                              fontSize: 14,
                              height: 1.5,
                            )),
                        animationEnabled: true,
                        size: 140,
                        customColors: CustomSliderColors(
                            hideShadow: true,
                            trackColor:
                                Customcolors.firstgradientcolor.withAlpha(100),
                            progressBarColors: [
                              Customcolors.firstgradientcolor,
                              Customcolors.secondgradientcoolor
                            ])),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      const TextSpan(
                          text: "Feels Like",
                          style: TextStyle(
                              color: Customcolors.textcolorBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 0.8)),
                      TextSpan(text: "  "),
                      TextSpan(
                          text: "${WeatherDataCurrent.current.feelslike}",
                          style: const TextStyle(
                              color: Customcolors.textcolorBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 0.8)),
                    ])),
                    Container(
                      height: 25,
                      width: 1,
                      color: Customcolors.dividerLine,
                      margin: EdgeInsets.only(left: 40, right: 40),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      const TextSpan(
                          text: "UV Index",
                          style: TextStyle(
                            color: Customcolors.textcolorBlack,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 0.8,
                          )),
                      TextSpan(text: "  "),
                      TextSpan(
                          text: "${WeatherDataCurrent.current.uvIndex}",
                          style: const TextStyle(
                              color: Customcolors.textcolorBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 0.8)),
                    ])),
                  ],
                )
              ],
            ))
      ],
    );
  }
}
