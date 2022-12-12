import 'package:get/get.dart';
import 'package:pusat_pengaduan/utils/route.dart';

class RegisterController extends GetxController {
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  navigateToHomePage() {
    // Get.toNamed(beritaDetailRoute);
    Get.toNamed(homePageRoute);
  }

  navigateToLogin() {
    // Get.toNamed(beritaDetailRoute);
    Get.toNamed(loginRoute);
  }
}
