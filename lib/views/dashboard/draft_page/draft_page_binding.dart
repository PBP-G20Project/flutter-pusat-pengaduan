import 'package:get/get.dart';
import 'package:pusat_pengaduan/views/dashboard/draft_page/controller/draft_controller.dart';


class DraftPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DraftPageController());
  }
}
