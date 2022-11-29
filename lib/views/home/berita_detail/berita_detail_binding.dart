import 'package:get/get.dart';
import 'package:pusat_pengaduan/views/home/berita_detail/controller/berita_detail_controller.dart';

class BeritaDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BeritaDetailController());
  }
}
