import 'package:get/get.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_user/controller/dashboard_user_controller.dart';

class DashboardUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardUserController());
  }
}
