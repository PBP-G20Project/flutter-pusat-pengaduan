import 'dart:async';
import 'package:get/get.dart';
import 'package:pusat_pengaduan/utils/route.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    launchApp();
  }

  launchApp() {
    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(homePageRoute);
    });
  }
}
