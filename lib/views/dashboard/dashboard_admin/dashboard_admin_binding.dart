import 'package:get/get.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_admin/controller/dashboard_admin_controller.dart';

class DashboardAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardAdminController());
  }
}
