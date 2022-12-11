import 'package:get/get.dart';
import 'package:pusat_pengaduan/utils/route.dart';

class HomePageController extends GetxController {
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  

  // contoh penggunaan navigator pushNamed dengan getx
  navigateToBeritaDetail() {
    // Get.toNamed(beritaDetailRoute);
    Get.toNamed(beritaDetailRoute);
  }

  navigateToLogin() {
    Get.toNamed(loginRoute);
  }
}
