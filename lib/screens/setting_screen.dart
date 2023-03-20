import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openai/controllers/setting_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () async {
                if (controller.formKey.currentState!.validate()) {
                  Get.defaultDialog(content: const CircularProgressIndicator());
                  //  print("1");
                  await Future.delayed(
                      Duration(seconds: 2), await controller.onSave());

                  Get.back();
                  Get.back();
                } else {
                  print("not validate");
                }
              },
              child: const Text("Save"),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView(
                  children: ["Max Length", "Temerature"]
                      .map((e) => ListTile(title: Text(e)))
                      .toList()),
            ),
            const Spacer(),
            Expanded(
              child: Form(
                key: controller.formKey,
                child: ListView(children: [
                  TextFormField(
                    controller: controller.maxLengthController,
                    textAlign: TextAlign.center,
                    //  initialValue: '100',
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(hintText: controller.maxLengthHint),
                    validator: (value) {
                      if (value!.isEmpty || value == '0') {
                        return "field required";
                      }
                      if (int.parse(value) > 4000) {
                        return '4000 is maximum capicity';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.tempController,
                    // enabled: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: controller.tempHint),
                    //initialValue: controller.tempHint,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "field required";
                      }
                      if (int.parse(value) > 4000) {
                        return 'maximum capicity is 4000';
                      }
                      return null;
                    },
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
