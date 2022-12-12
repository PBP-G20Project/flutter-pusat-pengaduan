import 'package:get/get.dart';
import 'package:pusat_pengaduan/views/register/controller/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
