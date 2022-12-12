import 'dart:html';

import 'package:flutter/material.dart';

import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_user/controller/dashboard_user_controller.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_user/models/dashboard_user_model.dart';

import 'package:pusat_pengaduan/common/constant.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenPageState();
}

class _CardScreenPageState extends State<CardScreen> {
  final controller = Get.find<DashboardUserController>();

  getLaporan(request) async {
    List<LaporanUser> listLaporan = [];
    final response =
        await request.get("http://localhost:8000/dashboard_user/Laporan/");
    for (var d in response) {
      if (d != null) {
        listLaporan.add(LaporanUser.fromJson(d));
      }
    }
    return listLaporan;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return FutureBuilder(
      future: getLaporan(request),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          for (var data in snapshot.data) {
            print(data.fields.title);
          }
        return Card(
        color: kWhiteColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
            child: SizedBox(height: 200,child:Container(
              padding: EdgeInsets.all(15),
              child:Column(
                children: [
                  Row(
                    children:[
                  Text("Judul: ${snapshot.data[snapshot.data.length-1].fields.title}")
                ]),
              const Spacer(),
              Row(
                    children:[
                  Text("Instansi yang terkait: ${snapshot.data[snapshot.data.length-1].fields.institution}")
                ]),
                Row(
                    children:[
                  Text("Tingkat instansi: ${snapshot.data[snapshot.data.length-1].fields.institutionLevel}")
                ]),
                Row(
                    children:[
                  Text("Pihak yang terlibat: ${snapshot.data[snapshot.data.length-1].fields.involvedParty}")
                ]),
                Row(
                    children:[
                  Text("Lokasi: ${snapshot.data[snapshot.data.length-1].fields.location}")
                ]),
                Row(
                    children:[
                  Text("Tanggal: ${snapshot.data[snapshot.data.length-1].fields.date}")
                ]),
                const Spacer(),
                Row(
                    children:[
                  Text(snapshot.data[snapshot.data.length-1].fields.content.substring(3,snapshot.data[snapshot.data.length-1].fields.content.length -4))
                ])
                ]),
              )
              )
      );
          return Text("1");
        }
      },
    );
  }
}
