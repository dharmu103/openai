import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openai/controllers/theme_controller.dart';

import '../screens/setting_screen.dart';

PreferredSizeWidget appbar() {
  final themeController = Get.put(ThemeController());
  return AppBar(
    title: const Text('AI-Bot'),
    actions: [
      Container(
        width: 80,
        padding: const EdgeInsets.all(14),
        child: Obx(() {
          return AnimatedToggleSwitch.dual(
            onChanged: (value) async {
              // print(value);
              themeController.theme.value = value;
              await themeController.box.write('isDarkMode', value);
              Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
            },
            current: themeController.theme.value,
            first: false,
            second: true,
            borderColor: Colors.transparent,
            borderWidth: 5.0,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1.5),
              ),
            ],
            colorBuilder: (b) => b ? Colors.white : Colors.white,
            iconBuilder: (value) => value
                ? const Icon(
                    Icons.brightness_4,
                    size: 20,
                    color: Colors.black,
                  )
                : const Icon(
                    Icons.light_mode,
                    size: 20,
                    color: Colors.yellow,
                  ),
          );
        }),
      ),
      PopupMenuButton(
          onSelected: (value) {
            if (value == 1) {
              Get.to(() => const SettingScreen(),
                  transition: Transition.rightToLeftWithFade);
            }
          },
          position: PopupMenuPosition.under,
          itemBuilder: ((context) {
            return [
              const PopupMenuItem(
                value: 1,
                child: Text("Setting"),
              ),
              const PopupMenuItem(value: 2, child: Text("How to use")),
              const PopupMenuItem(value: 3, child: Text("About us"))
            ];
          })),
    ],
  );
}
