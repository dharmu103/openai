import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:openai/controllers/setting_controller.dart';
import 'package:openai/controllers/theme_controller.dart';
import 'package:openai/widgets/app_bar.dart';

import '../controllers/home_controller.dart';
import '../widgets/search_box.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    final controller = Get.put(HomeController());
    final settingcontroller = Get.put(SettingController());

    return Scaffold(
      appBar: appbar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.output.value,
                    ),
                    const SizedBox(
                      height: 150,
                    )
                  ],
                ),
              );
            }),
          ),
          const Positioned(bottom: 0, child: SearchBox()),
          Positioned(
              top: 0,
              child: SizedBox(
                  width: Get.width,
                  child: GetBuilder<HomeController>(builder: (_) {
                    return controller.isLoading.value
                        ? const LinearProgressIndicator()
                        : const SizedBox();
                  }))),
          Positioned(
              right: 0,
              child: Obx(() {
                return controller.output.value != ""
                    ? IconButton(
                        icon: const Icon(Icons.copy),
                        tooltip: "copy",
                        onPressed: () async {
                          await Clipboard.setData(
                              ClipboardData(text: controller.output.value));
                        },
                      )
                    : const SizedBox();
              }))
        ],
      ),
    );
  }
}
