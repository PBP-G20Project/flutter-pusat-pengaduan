import 'package:get/get.dart';
import 'package:pusat_pengaduan/utils/route.dart';

class DashboardUserController extends GetxController {
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  navigateToProfile() {
    Get.toNamed(profileRoute);
  }

  navigateToForm() {
    Get.toNamed(submissionRoute);
  }

  navigateToDraft() {
    Get.toNamed(draftFormRoute);
  }
}
