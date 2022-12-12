import 'package:flutter/material.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_admin/dashboard_admin_get.dart';

class ListReport extends StatelessWidget {
  const ListReport({super.key, this.request});

  final request;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
                    style: TextStyle(color: kErrorColor, fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.fromLTRB(
                          kDefaultPadding,
                          kDefaultPadding / 2,
                          kDefaultPadding,
                          kDefaultPadding / 2),
                      child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(5.0),
                        color: kBananaColor200,
                        shadowColor: kDarkPrimaryColor,
                        child: ListTile(
                          leading: Container(
                            color: kLavenderColor,
                            width: 50,
                            height: 50,
                          ),
                          title: Text(snapshot.data![index].fields.title),
                          subtitle: Text(snapshot.data![index].fields.content),
                          isThreeLine: true,
                        ),
                      )));
            }
          }
        });
  }
}
