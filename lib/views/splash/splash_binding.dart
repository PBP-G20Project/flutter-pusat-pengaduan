import 'package:get/get.dart';
import 'package:pusat_pengaduan/views/splash/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
