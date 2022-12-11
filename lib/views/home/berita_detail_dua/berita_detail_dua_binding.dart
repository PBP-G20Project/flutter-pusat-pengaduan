import 'package:get/get.dart';
import 'package:pusat_pengaduan/views/home/berita_detail_dua/controller/berita_detail_dua_controller.dart';

class BeritaDetailDuaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BeritaDetailControllerDua());
  }
}