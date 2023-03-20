import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  final box = GetStorage();
  TextEditingController maxLengthController = TextEditingController();
  TextEditingController tempController = TextEditingController();
  String? maxLengthHint;
  String? tempHint;
  final formKey = GlobalKey<FormState>();

  @override
  onInit() {
    super.onInit();
    getSetting();
  }

  onSave() async {
    await box.write("maxlength", maxLengthController.text.tr.toString());
    await box.write("temp", tempController.text.tr.toString());
  }

  getSetting() async {
    maxLengthHint = box.read("maxlength");
    tempHint = box.read("temp");
    print("maxLengthHint is $maxLengthHint");
    print("temphint is $tempHint");
    if (maxLengthHint == null) {
      await box.write("maxlength", "100");
    }
    if (tempHint == null) {
      await box.write("temp", "0");
    }
    maxLengthHint = box.read("maxlength");
    tempHint = box.read("temp");
  }
}
