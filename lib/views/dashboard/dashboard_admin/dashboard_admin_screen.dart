import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/controller/route_controller.dart';
import 'package:pusat_pengaduan/views/widgets/custom_drawer.dart';
import 'package:get/get.dart';

import 'package:pusat_pengaduan/views/dashboard/dashboard_admin/controller/dashboard_admin_controller.dart';

import '../../submission_form/widgets/custom_dropdown.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class DashboardAdminScreen extends StatefulWidget {
  const DashboardAdminScreen({super.key});

  @override
  State<DashboardAdminScreen> createState() => _DashboardAdmin();
}

class _DashboardAdmin extends State<DashboardAdminScreen> {
  List reportItem = [];

  Future getAllStatus() async {
    var url =
        Uri.parse("http://127.0.0.1:8000/dashboard_admin/show_all_report/");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        reportItem = jsonData;
      });
    }
  }

  Future getAllPending() async {
    var url =
        Uri.parse("http://127.0.0.1:8000/dashboard_admin/show_all_pending/");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        reportItem = jsonData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardAdminController>();
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Admin'),
      ),
      drawer: CustomDrawer(
        title: 'Pusat Pengaduan',
        menu: RouteController.getDrawerRoute(kDashboardAdmin, request),
      ),
      body: ListView(controller: controller.scrollController, children: [
        Container(
          margin: const EdgeInsets.all(kDefaultPadding),
          child: Column(children: [
            CustomDropdownField(
                label: "Pengecekan Status",
                hint: "Semua",
                items: const ["Semua", "Pending", "Diproses", "Selesai"],
                onChanged: (value) => setState(() {
                      controller.statusController.value.text = value!;
                    })),
            Text(controller.statusController.value.text)
            // FutureBuilder(
            // )
          ]),
        )
      ]),
    );
  }
}
