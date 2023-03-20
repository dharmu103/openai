import 'package:get/get.dart';
import 'package:openai/screens/home_screens.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 5), () {
      Get.offAll(() => const HomeScreens());
    });
    super.onInit();
  }
}
