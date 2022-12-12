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
    Get.toNamed(dashboardUserRoute);
  }

  navigateToLogin() {
    Get.toNamed(loginRoute);
   }
  navigateToBeritaDetailDua() {
    Get.toNamed(beritaDetailDuaRoute);
  }

  navigateToBeritaDetailTiga() {
    Get.toNamed(beritaDetailTigaRoute);
  }


  navigateToReviewForm() {
    Get.toNamed(reviewRoute);
  }
}
