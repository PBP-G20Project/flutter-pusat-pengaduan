import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_admin/widget/custom_dropdown.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_admin/widget/list_report.dart';

import 'controller/dashboard_admin_controller.dart';

class DashboardAdminScreenV2 extends StatefulWidget {
  const DashboardAdminScreenV2({super.key});

  @override
  State<DashboardAdminScreenV2> createState() => _DashboardAdminScreenV2State();
}

class _DashboardAdminScreenV2State extends State<DashboardAdminScreenV2> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardAdminController>();
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Admin'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(kDefaultPadding),
            child: CustomDropdownField(
                label: "Pengecekan Status",
                hint: "Semua",
                items: const ["Semua", "Pending", "Diproses", "Selesai"],
                onChanged: (value) => setState(() {
                      controller.statusController.value.text = value!;
                    })),
          ),
            Expanded(
              child: ListReport(
                request: request,
                status: controller.statusController.value.text,
              ),
            ),
        ],
      ),
    );
  }
}
