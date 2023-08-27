import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum DeviceScreen { smartPhone, computer }

class AppSettings extends GetxController {
  static double? screenWidth;
  static double? screenHeight;
  static DeviceScreen? screenType;

  AppSettings.init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    if (screenWidth! > 600) {
      screenType = DeviceScreen.computer;
      update();
    } else {
      screenType = DeviceScreen.smartPhone;
      update();
    }

    Get.put(AppSettings);
  }
}
