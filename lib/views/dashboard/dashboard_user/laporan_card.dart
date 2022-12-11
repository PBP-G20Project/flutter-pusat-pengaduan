import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:http/http.dart' as http;
import 'package:pusat_pengaduan/views/dashboard/dashboard_user/models/dashboard_user_model.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_user/function/fetch_laporan.dart';

class LaporanCard extends StatefulWidget {
  const LaporanCard({super.key});

  @override
  LaporanCardState createState() => LaporanCardState();
}

class LaporanCardState extends State<LaporanCard> {
  void refreshWidget() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final request = context.read<CookieRequest>();
    Future fut = fetchLaporan();
    return (FutureBuilder(
      future: fut,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.red,
          ));
        } else {
          if (!snapshot.hasData) {
            return Column(
              children: const [
                Text(
                  "Tidak ada Laporan tersedia :(",
                  style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                ),
                SizedBox(height: 8),
              ],
            );
          } else {
            return ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (data, index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(5.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: SizedBox(
                          height: 180,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                const Spacer(),
                                Row(
                                  children: [
                                    const Text("Judul: "),
                                    Text(
                                      snapshot
                                          .data![
                                              snapshot.data!.length - index - 1]
                                          .fields
                                          .height
                                          .toString(),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    const Text("Berat Badan: "),
                                    Text(
                                      snapshot
                                          .data![
                                              snapshot.data!.length - index - 1]
                                          .fields
                                          .weight
                                          .toString(),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    const Text("Dibuat pada: "),
                                    Text(
                                      snapshot
                                          .data![
                                              snapshot.data!.length - index - 1]
                                          .fields
                                          .date
                                          .toString(),
                                      // snapshot.data![snapshot.data!.length - index - 1].fields.date.toString(),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    const Text("Author: "),
                                    Text(
                                      snapshot
                                          .data![
                                              snapshot.data!.length - index - 1]
                                          .fields
                                          .author,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))),
            );
          }
        }
      },
    ));
  }
}
