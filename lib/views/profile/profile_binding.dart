import 'package:get/get.dart';
import 'package:pusat_pengaduan/views/profile/controller/profile_controller.dart';


class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
