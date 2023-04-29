import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/controllers/global_controller.dart';
import 'package:weatherapp_starter_project/utils/customs_colors.dart';

class Headerwidget extends StatefulWidget {
  const Headerwidget({super.key});

  @override
  State<Headerwidget> createState() => _HeaderwidgetState();
}

class _HeaderwidgetState extends State<Headerwidget> {
  String city = "";

  String date = DateFormat("yMMMd").format(DateTime.now());
  final Globalcontroller globalcontroller =
      Get.put(Globalcontroller(), permanent: true);
  @override
  void initState() {
    getAddress(globalcontroller.getlattitude().value,
        globalcontroller.getlongitude().value);

    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);

    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.topLeft,
            child: Text(
              city,
              style: TextStyle(fontSize: 30, height: 2),
            )),
        Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            alignment: Alignment.topLeft,
            child: Text(
              date,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[700],
                height: 1.5,
              ),
            )),
        Container(
          height: 1,
          color: Customcolors.dividerLine,
        )
      ],
    );
  }
}
