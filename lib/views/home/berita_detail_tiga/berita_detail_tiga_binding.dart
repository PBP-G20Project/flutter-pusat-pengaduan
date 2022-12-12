import 'package:get/get.dart';
import 'package:pusat_pengaduan/views/home/berita_detail_tiga/controller/berita_detail_tiga_controller.dart';

class BeritaDetailTigaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BeritaDetailControllerTiga());
  }
}