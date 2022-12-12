import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_user/controller/dashboard_user_controller.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_user/models/dashboard_user_model.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenPageState();
}

class _CardScreenPageState extends State<CardScreen> {
  final controller = Get.find<DashboardUserController>();

  getLaporan(request) async {
    List<LaporanUser> listLaporan = [];
    final response = await request
        .get("https://pusat-pengaduan.up.railway.app/dashboard_user/Laporan/");
    for (var d in response) {
      if (d != null) {
        listLaporan.add(LaporanUser.fromJson(d));
      }
    }
    return listLaporan;
  }

  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return FutureBuilder(
      future: getLaporan(request),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                      color: kBananaColor200,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: SizedBox(
                          height: 200,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            child: Column(children: [
                              Row(children: [
                                Text("${snapshot.data![index].fields.title}",
                                    style: kRubik.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ]),
                              const Spacer(),
                              Row(children: [
                                Text(
                                    "Instansi yang terkait: ${snapshot.data![index].fields.institution}")
                              ]),
                              Row(children: [
                                Text(
                                    "Tingkat instansi: ${snapshot.data![index].fields.institutionLevel}")
                              ]),
                              Row(children: [
                                Text(
                                    "Pihak yang terlibat: ${snapshot.data[index].fields.involvedParty}")
                              ]),
                              Row(children: [
                                Text(
                                    "Lokasi: ${snapshot.data[index].fields.location}")
                              ]),
                              Row(children: [
                                Text(
                                    "Tanggal: ${DateFormat('yyyy-MM-dd').format(snapshot.data[index].fields.date)}")
                              ]),
                              Row(children: [
                                Text(
                                    "Status Laporan: ${snapshot.data[index].fields.status}")
                              ]),
                              const Spacer(),
                              Row(children: [
                                Flexible(
                                    child: Text(snapshot
                                        .data[index].fields.content
                                        .substring(
                                            3,
                                            snapshot.data[index].fields.content
                                                    .length -
                                                4)))
                              ]),
                            ]),
                          )))));
        }
      },
    );
  }
}
