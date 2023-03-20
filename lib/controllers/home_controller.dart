import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:openai/controllers/setting_controller.dart';
import 'package:openai/services/api.dart';

class HomeController extends GetxController {
  TextEditingController inputTextController = TextEditingController();
  RxString output = ''.obs;
  RxBool isLoading = false.obs;

  getData() async {
    var s;
    output.value = '';
    isLoading = true.obs;
    update();
    try {
      var res = await Api().getData(
          inputTextController.text.toString(),
          Get.find<SettingController>().maxLengthHint,
          Get.find<SettingController>().tempHint);
      Map<String, dynamic> x = jsonDecode(res.body) as Map<String, dynamic>;
      s = x["choices"][0]["text"];
    } catch (e) {
      s = e;
    }
    isLoading = false.obs;
    update();
    // print(res.runtimeType);

    s.toString().replaceAll(RegExp("\n+"), '\n');
    // print('output is $s');

    var time = 1;
    if (s.length > 400) {
      time = 10;
    } else if (s.length > 300) {
      time = 15;
    } else if (s.length > 200) {
      time = 25;
    } else {
      time = 50;
    }
    for (int i = 0; i < s.length; i++) {
      await Future.delayed(Duration(milliseconds: time),
          (() => output.value = output.value + s[i]));
    }
  }
}
