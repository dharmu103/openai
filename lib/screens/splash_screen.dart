import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:openai/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(SplashController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Center(child: Lottie.asset('assets/lottie/splash.json')),
      ),
    );
  }
}
