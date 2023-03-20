import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final box = GetStorage();
  RxBool theme = false.obs;

  @override
  void onInit() async {
    var val = await box.read('isDarkMode');
    if (val != null) {
      theme.value = val;
    }
    // print(val);
    // print(theme.value);
    Get.changeThemeMode(theme.value ? ThemeMode.dark : ThemeMode.light);

    super.onInit();
  }
}
