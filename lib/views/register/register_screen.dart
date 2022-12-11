import 'package:flutter/material.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/controller/route_controller.dart';
import 'package:pusat_pengaduan/views/widgets/custom_drawer.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      drawer: CustomDrawer(
        title: 'Pusat Pengaduan',
        menu: RouteController.getDrawerRoute(kRegister),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Register Screen'),
          ],
        ),
      ),
    );
  }
}