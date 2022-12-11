import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
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
    final request = context.watch<CookieRequest>();
    // test_logout(request);

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
            // const Text("test ke Register"),
            // ElevatedButton(
            //     onPressed: () => controller
            //         .navigateToregister(), // contoh penggunaan navigator pushNamed dengan getx
            //     child: const Text('Register')),
            // const Text("test ke Profile"),
            // ElevatedButton(
            //     onPressed: () => controller
            //         .navigateToProfile(), // contoh penggunaan navigator pushNamed dengan getx
            //     child: const Text('Profile')),
            // TextButton(
            //   style: ButtonStyle(
            //     backgroundColor: MaterialStateProperty.all(Colors.blue),
            //   ),
            //   onPressed: () async {
            //     logout_acc(request).then((result) {
            //       print(request.loggedIn);
            //       print("logout");
            //     });
            //   },
            //   child: const Text(
            //     "Simpan",
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
