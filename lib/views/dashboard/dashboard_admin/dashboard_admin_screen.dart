import 'package:flutter/material.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/controller/route_controller.dart';
import 'package:pusat_pengaduan/views/widgets/custom_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class DashboardAdminScreen extends StatelessWidget {
  const DashboardAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Admin'),
      ),
      drawer: CustomDrawer(
        title: 'Pusat Pengaduan',
        menu: RouteController.getDrawerRoute(kDashboardAdmin, request),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Dashboard Admin Screen'),
          ],
        ),
      ),
    );
  }
}
