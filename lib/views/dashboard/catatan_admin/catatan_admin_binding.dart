import 'package:get/get.dart';
import 'package:pusat_pengaduan/views/dashboard/catatan_admin/controller/catatan_admin_controller.dart';

class CatatanAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CatatanAdminController());
  }
}
