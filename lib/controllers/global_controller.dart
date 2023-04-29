import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/Api/Fetch_api.dart';

import '../weather/weatherdata.dart';

class Globalcontroller extends GetxController {
  // create varius variables
  final RxBool _isloading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;
  //
  RxBool checkLoading() => _isloading;
  RxDouble getlattitude() => _lattitude;
  RxDouble getlongitude() => _longitude;
  final _weatherdata = WeatherData().obs;

  WeatherData getdata() {
    return _weatherdata.value;
  }

  @override
  void onInit() {
    if (_isloading.isTrue) {
      getLocation();
    } else {
      gettIndex();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }
    // status of permission
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location Permission are denied Forever");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location Permission is denied");
      }
    }
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;
      Fetchweatherapi()
          .getapidata(value.latitude, value.longitude)
          .then((value) {
        _weatherdata.value = value;
        _isloading.value = false;
      });
    });
  }

  RxInt gettIndex() {
    return _currentIndex;
  }
}
