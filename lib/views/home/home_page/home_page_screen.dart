import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/controller/route_controller.dart';
import 'package:pusat_pengaduan/views/home/home_page/controller/home_page_controller.dart';
import 'package:pusat_pengaduan/views/widgets/custom_drawer.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // get controller
    final controller = Get.find<HomePageController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pusat Pengaduan',
            style: kRubik.copyWith(
              fontSize: 18,
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
            )),
      ),
      drawer: CustomDrawer(
        title: 'Pusat Pengaduan',
        menu: RouteController.getDrawerRoute(kHome),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Contoh Navigator push/pushNamed"),
            ElevatedButton(
                onPressed: () => controller
                    .navigateToBeritaDetail(), // contoh penggunaan navigator pushNamed dengan getx
                child: const Text('Berita Detail')),
            const Text("test ke login"),
            ElevatedButton(
                onPressed: () => controller
                    .navigateToLogin(), // contoh penggunaan navigator pushNamed dengan getx
                child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
