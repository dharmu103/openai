import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';
import '../controllers/theme_controller.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final themeController = Get.put(ThemeController());

    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5,
        ),
      ]),
      child: Stack(
        children: [
          Obx(() {
            return TextFormField(
                controller: controller.inputTextController,
                // onFieldSubmitted: ((value) {
                //   // _controller.getData(value);
                // }),
                textInputAction: TextInputAction.search,
                autocorrect: false,
                autofocus: true,
                cursorColor:
                    themeController.theme.value ? Colors.black : Colors.black12,
                style: GoogleFonts.laila(color: Colors.black87),
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(right: 50),
                    focusedBorder: InputBorder.none,
                    hintText: '  // enter question here...'));
          }),
          Positioned(
              right: 0,
              child: GetBuilder<HomeController>(builder: (_) {
                return Obx(() {
                  return IconButton(
                    hoverColor: Colors.indigo[900],
                    icon: controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : const Icon(Icons.send),
                    color: themeController.theme.value
                        ? Colors.black
                        : Colors.indigo,
                    onPressed: (() {
                      if (controller.isLoading.value == false) {
                        controller.getData();
                      }
                    }),
                  );
                });
              }))
        ],
      ),
    );
  }
}
