import 'package:get/get.dart';
import 'package:pusat_pengaduan/utils/route.dart';

class ProfileController extends GetxController {
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  navigateToLogin() {
    Get.toNamed(loginRoute);
  }

  navigateToHomePage() {
    Get.toNamed(homePageRoute);
  }
}
