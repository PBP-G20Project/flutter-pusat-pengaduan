import 'package:get/get.dart';
import 'package:pusat_pengaduan/utils/route.dart';

class ReviewController extends GetxController {
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  navigateToReviewForm() {
    Get.toNamed(homePageRoute);
  }

  navigateToHomePage() {
    // Get.toNamed(beritaDetailRoute);
    Get.toNamed(homePageRoute);
  }
}
