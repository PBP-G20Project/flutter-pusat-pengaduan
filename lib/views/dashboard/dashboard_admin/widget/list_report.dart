import 'package:flutter/material.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_admin/dashboard_admin_get.dart';

class ListReport extends StatelessWidget {
  const ListReport({super.key, this.request, required this.status});

  final request;
  final String status;

  @override
  Widget build(BuildContext context) {
    if (status == 'Semua') {
      return FutureBuilder(
          future: getAllStatus(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Text('Mohon Menunggu Data Fetching');
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Belum Ada Laporan",
                      style: TextStyle(color: kErrorColor, fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) =>
                        Padding(
                            padding: const EdgeInsets.fromLTRB(
                                kDefaultPadding,
                                kDefaultPadding / 2,
                                kDefaultPadding,
                                kDefaultPadding / 2),
                            child: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.circular(5.0),
                              color: kPrimaryColor,
                              shadowColor: kDarkPrimaryColor,
                              child: ListTile(
                                leading: Container(
                                  color:
                                  (snapshot.data![index].fields.status ==
                                      'PENDING') ? kLavenderColor :
                                  (snapshot.data![index].fields.status ==
                                      'DIPROSES') ? kWarningColor :
                                  (snapshot.data![index].fields.status ==
                                      'SELESAI') ? kSuccessColor :
                                  kWarningColor,
                                  width: 50,
                                  height: 50,
                                ),
                                title: Text(
                                    snapshot.data![index].fields.title,
                                    style: const TextStyle(
                                        color: kBananaColor200)),
                                subtitle: Text(
                                    snapshot.data![index].fields
                                        .content,
                                    style: const TextStyle(
                                        color: kBananaColor200)),
                                isThreeLine: true,
                              ),
                            )));
              }
            }
          });
    } else if (status == 'Pending') {
      return FutureBuilder(
          future: getPending(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Belum Ada Laporan",
                      style: TextStyle(color: kErrorColor, fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) =>
                        Padding(
                            padding: const EdgeInsets.fromLTRB(
                                kDefaultPadding,
                                kDefaultPadding / 2,
                                kDefaultPadding,
                                kDefaultPadding / 2),
                            child: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.circular(5.0),
                              color: kPrimaryColor,
                              shadowColor: kDarkPrimaryColor,
                              child: ListTile(
                                leading: Container(
                                  color: kLavenderColor,
                                  width: 50,
                                  height: 50,
                                ),
                                title: Text(
                                    snapshot.data![index].fields.title,
                                    style: const TextStyle(
                                        color: kBananaColor200)),
                                subtitle: Text(
                                    snapshot.data![index].fields
                                        .content,
                                    style: const TextStyle(
                                        color: kBananaColor200)),
                                isThreeLine: true,
                              ),
                            )));
              }
            }
          });
    } else if (status == 'Diproses') {
      return FutureBuilder(
          future: getDiproses(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Belum Ada Laporan",
                      style: TextStyle(color: kErrorColor, fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) =>
                        Padding(
                            padding: const EdgeInsets.fromLTRB(
                                kDefaultPadding,
                                kDefaultPadding / 2,
                                kDefaultPadding,
                                kDefaultPadding / 2),
                            child: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.circular(5.0),
                              color: kPrimaryColor,
                              shadowColor: kDarkPrimaryColor,
                              child: ListTile(
                                leading: Container(
                                  color: kWarningColor,
                                  width: 50,
                                  height: 50,
                                ),
                                title: Text(
                                    snapshot.data![index].fields.title,
                                    style: const TextStyle(
                                        color: kBananaColor200)),
                                subtitle: Text(
                                    snapshot.data![index].fields
                                        .content,
                                    style: const TextStyle(
                                        color: kBananaColor200)),
                                isThreeLine: true,
                              ),
                            )));
              }
            }
          });
    } else if (status == 'Selesai') {
      return FutureBuilder(
          future: getSelesai(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Belum Ada Laporan",
                      style: TextStyle(color: kErrorColor, fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) =>
                        Padding(
                            padding: const EdgeInsets.fromLTRB(
                                kDefaultPadding,
                                kDefaultPadding / 2,
                                kDefaultPadding,
                                kDefaultPadding / 2),
                            child: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.circular(5.0),
                              color: kPrimaryColor,
                              shadowColor: kDarkPrimaryColor,
                              child: ListTile(
                                leading: Container(
                                  color: kSuccessColor,
                                  width: 50,
                                  height: 50,
                                ),
                                title: Text(
                                    snapshot.data![index].fields.title,
                                    style: const TextStyle(
                                        color: kBananaColor200)),
                                subtitle: Text(
                                    snapshot.data![index].fields
                                        .content,
                                    style: const TextStyle(
                                        color: kBananaColor200)),
                                isThreeLine: true,
                              ),
                            )));
              }
            }
          });
    } else {
      return FutureBuilder(
          future: getDitolak(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Belum Ada Laporan",
                      style: TextStyle(color: kErrorColor, fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) =>
                        Padding(
                            padding: const EdgeInsets.fromLTRB(
                                kDefaultPadding,
                                kDefaultPadding / 2,
                                kDefaultPadding,
                                kDefaultPadding / 2),
                            child: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.circular(5.0),
                              color: kPrimaryColor,
                              shadowColor: kDarkPrimaryColor,
                              child: ListTile(
                                leading: Container(
                                  color: kErrorColor,
                                  width: 50,
                                  height: 50,
                                ),
                                title: Text(
                                    snapshot.data![index].fields.title,
                                    style: const TextStyle(
                                        color: kBananaColor200)),
                                subtitle: Text(
                                    snapshot.data![index].fields
                                    .content,
                                    style: const TextStyle(
                                        color: kBananaColor200)),
                                isThreeLine: true,
                              ),
                            )));
              }
            }
          });
    }
  }
}
