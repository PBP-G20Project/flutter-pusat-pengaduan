import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/controller/route_controller.dart';
import 'package:pusat_pengaduan/views/widgets/custom_drawer.dart';

import 'package:pusat_pengaduan/views/dashboard/dashboard_admin/controller/dashboard_admin_controller.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_admin/dashboard_admin_get.dart';

import '../dashboard_admin/widget/custom_dropdown.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class DashboardAdminScreen extends StatefulWidget {
  const DashboardAdminScreen({super.key});

  @override
  State<DashboardAdminScreen> createState() => _DashboardAdmin();
}

class _DashboardAdmin extends State<DashboardAdminScreen> {
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
      body: Container(
        margin: const EdgeInsets.all(kDefaultPadding),
        child: ListView(children: [
          CustomDropdownField(
              label: "Pengecekan Status",
              hint: "Semua",
              items: const ["Semua", "Pending"],
              onChanged: (value) => setState(() {
                    controller.statusController.value.text = value!;
                  })),
          Text(controller.statusController.value.text),
          if (controller.statusController.value.text == 'Semua') ...[
            FutureBuilder(
                future: getAllStatus(request),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Text('hello');
                  } else {
                    if (!snapshot.hasData) {
                      return Column(
                        children: const [
                          Text(
                            "Belum Ada Laporan",
                            style:
                                TextStyle(color: kErrorColor, fontSize: 20),
                          ),
                          SizedBox(height: 8),
                        ],
                      );
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => Padding(
                              padding: const EdgeInsets.all(kDefaultPadding),
                              child: Material(
                                elevation: 2.0,
                                borderRadius: BorderRadius.circular(5.0),
                                color: kBananaColor200,
                                shadowColor: kDarkPrimaryColor,
                                child: ListTile(
                                  leading: Container(
                                      decoration: (snapshot.data![index]
                                                  .fields.status ==
                                              'PENDING')
                                          ? const BoxDecoration(
                                              border: Border(),
                                              color: kLavenderColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)))
                                          : (snapshot.data![index].fields.status ==
                                                  'DIPROSES')
                                              ? const BoxDecoration(
                                                  border: Border(),
                                                  color: kWarningColor,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(20)))
                                              : (snapshot.data![index].fields.status ==
                                                      'SELESAI')
                                                  ? const BoxDecoration(
                                                      border: Border(),
                                                      color: kSuccessColor,
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(
                                                              20)))
                                                  : const BoxDecoration(
                                                      border: Border(),
                                                      color: kErrorColor,
                                                      borderRadius:
                                                          BorderRadius.all(Radius.circular(20)))),
                                  title: Text(
                                      snapshot.data![index].fields.title),
                                  subtitle: Text(
                                      snapshot.data![index].fields.content),
                                  isThreeLine: true,
                                ),
                              )));
                    }
                  }
                })
          ] else if (controller.statusController.value.text == "Pending") ...[
            FutureBuilder(
                future: getAllStatus(request),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Text('hello');
                  } else {
                    if (!snapshot.hasData) {
                      return Column(
                        children: const [
                          Text(
                            "Belum Ada Laporan",
                            style:
                                TextStyle(color: kErrorColor, fontSize: 20),
                          ),
                          SizedBox(height: 8),
                        ],
                      );
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => Padding(
                              padding: const EdgeInsets.all(kDefaultPadding),
                              child: Material(
                                elevation: 2.0,
                                borderRadius: BorderRadius.circular(5.0),
                                color: kPrimaryColor,
                                shadowColor: kBananaColor200,
                                child: ListTile(
                                  leading: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(),
                                          color: kLavenderColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  title: Text(
                                      snapshot.data![index].fields.title),
                                  subtitle: Text(
                                      snapshot.data![index].fields.content),
                                  isThreeLine: true,
                                ),
                              )));
                    }
                  }
                })
          ]
        ]),
      ),
    );
  }
}
