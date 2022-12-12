import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/controller/route_controller.dart';
import 'package:pusat_pengaduan/views/widgets/custom_drawer.dart';

import 'package:pusat_pengaduan/views/dashboard/catatan_admin/controller/catatan_admin_controller.dart';

import '../dashboard_admin/widget/custom_dropdown.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import 'catatan_admin_data.dart';

class CatatanAdminScreen extends StatefulWidget {
  const CatatanAdminScreen({super.key});

  @override
  State<CatatanAdminScreen> createState() => _CatatanAdmin();
}

class _CatatanAdmin extends State<CatatanAdminScreen> {

  Future<List<AdminReminder>> getAllStatus(request) async {
    final response = await request.get("http://127.0.0.1:8000/dashboard_admin/get_reminder_json/");

    // json to AdminReport
    List<AdminReminder> adminReport = [];
    for (var d in response) {
      if (d != null) {
        adminReport.add(AdminReminder.fromJson(d));
      }
    }

    return adminReport;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CatatanAdminController>();
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
          child: Column(
              children: [
                CustomDropdownField(
                    label: "Status Catatan",
                    hint: "Semua",
                    items: const [
                      "Semua",
                      "Positif"
                    ],
                    onChanged: (value) => setState (() {
                      controller.statusController.value.text = value!;
                    })
                ),
                Text(controller.statusController.value.text),
                Column(
                  children: [
                    if (controller.statusController.value.text == 'Semua')...[
                      FutureBuilder(
                          future: getAllStatus(request),
                          builder: (context, AsyncSnapshot snapshot){
                            if (snapshot.data == null){
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
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (_, index) => Padding(
                                        padding: const EdgeInsets.all(kDefaultPadding),
                                        child: Material(
                                          elevation: 2.0,
                                          borderRadius: BorderRadius.circular(5.0),
                                          color: kBananaColor200,
                                          shadowColor: kDarkPrimaryColor,
                                          child:
                                          ListTile(
                                            trailing:
                                            Container(
                                                decoration: (snapshot.data![index].fields.status == 'PENDING') ?
                                                const BoxDecoration(
                                                    border: Border(),
                                                    color: kLavenderColor,
                                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                                ) :
                                                (snapshot.data![index].fields.status == 'DIPROSES') ?
                                                const BoxDecoration(
                                                    border: Border(),
                                                    color: kWarningColor,
                                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                                ) :
                                                (snapshot.data![index].fields.status == 'SELESAI') ?
                                                const BoxDecoration(
                                                    border: Border(),
                                                    color: kSuccessColor,
                                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                                ) :
                                                const BoxDecoration(
                                                    border: Border(),
                                                    color: kErrorColor,
                                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                                )
                                            ),
                                            title:
                                            Text(snapshot.data![index].fields.title),
                                            subtitle:
                                            Text(snapshot.data![index].fields.content),
                                            isThreeLine: true,
                                          ),
                                        )
                                    )
                                );
                              }
                            }

                          })
                    ] else if (controller.statusController.value.text == "Pending")...[
                      FutureBuilder(
                          future: getAllStatus(request),
                          builder: (context, AsyncSnapshot snapshot){
                            if (snapshot.data == null){
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
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (_, index) => Padding(
                                        padding: const EdgeInsets.all(kDefaultPadding),
                                        child: Material(
                                          elevation: 2.0,
                                          borderRadius: BorderRadius.circular(5.0),
                                          color: kPrimaryColor,
                                          shadowColor: kBananaColor200,
                                          child:
                                          ListTile(
                                            trailing:
                                            Container(
                                                decoration:
                                                const BoxDecoration(
                                                    border: Border(),
                                                    color: kLavenderColor,
                                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                                )
                                            ),
                                            title:
                                            Text(snapshot.data![index].fields.title),
                                            subtitle:
                                            Text(snapshot.data![index].fields.content),
                                            isThreeLine: true,
                                          ),
                                        )
                                    )
                                );
                              }
                            }
                          })
                    ]
                  ],
                )

              ]),
        )
      ]),
    );
  }
}
