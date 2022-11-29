import 'package:get/get.dart';
import 'package:pusat_pengaduan/views/home/review/controller/review_controller.dart';

class ReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ReviewController());
  }
}
