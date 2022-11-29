import 'package:get/get.dart';
import 'package:pusat_pengaduan/views/login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
