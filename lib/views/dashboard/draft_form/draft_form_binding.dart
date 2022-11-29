import 'package:get/get.dart';
import 'package:pusat_pengaduan/views/dashboard/draft_form/controller/draft_form_controller.dart';

class DraftFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DraftFormController());
  }
}
