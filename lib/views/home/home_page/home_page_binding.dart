import 'package:get/get.dart';
import 'package:pusat_pengaduan/views/home/home_page/controller/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}
