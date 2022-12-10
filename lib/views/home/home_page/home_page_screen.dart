import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/views/home/home_page/controller/home_page_controller.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  get_data(request) async {
    final response =
        await request.get("http://127.0.0.1:8000/auth/data_login/");
    print(response);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    // get controller
    final controller = Get.find<HomePageController>();
    final request = context.watch<CookieRequest>();
    get_data(request);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pusat Pengaduan',
            style: kRubik.copyWith(
              fontSize: 18,
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
            )),
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
            const Text("test ke Register"),
            ElevatedButton(
                onPressed: () => controller
                    .navigateToregister(), // contoh penggunaan navigator pushNamed dengan getx
                child: const Text('Register')),
          ],
        ),
      ),
    );
  }
}
