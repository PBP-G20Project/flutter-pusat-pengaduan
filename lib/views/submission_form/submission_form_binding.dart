import 'package:get/get.dart';
import 'package:pusat_pengaduan/views/submission_form/controller/submission_form_controller.dart';

class SubmissionFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SubmissionFormController());
  }
}
