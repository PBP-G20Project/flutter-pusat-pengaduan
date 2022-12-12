import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/views/dashboard/draft_page/controller/draft_controller.dart';
import 'package:pusat_pengaduan/views/dashboard/draft_form/widgets/custom_footer_button.dart';
import 'package:pusat_pengaduan/views/dashboard/draft_form/widgets/custom_textfield.dart';
import 'package:pusat_pengaduan/views/dashboard/draft_page/models/draft_model.dart';

class DraftScreen extends StatelessWidget {
  const DraftScreen({super.key});

  getDraft(request) async {
    List<DraftUser> listDraft = [];
    final response = await request.get(
        "https://pusat-pengaduan.up.railway.app/dashboard_user/ShowDraft/");
    for (var d in response) {
      if (d != null) {
        listDraft.add(DraftUser.fromJson(d));
      }
    }
    return listDraft;
  }


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DraftPageController>();
    final request = context.watch<CookieRequest>();

    return Scaffold(
        backgroundColor: kSecondaryColor01,
        appBar: AppBar(
          title: Text('Draft User',
              style: kRubik.copyWith(
                fontSize: 18,
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
              )),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.person_outline),
              tooltip: 'Profile',
              onPressed: () => controller.navigateToProfile(),
            )
          ],
        ),
        body: Column(
          children: [
            FutureBuilder(
                future: getDraft(request),
                builder: (context, AsyncSnapshot snapshot) {
                  return Expanded(
                    child: 
                      ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
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
                                            Text(
                                                "${snapshot.data![index].fields.title}",
                                                style: kRubik.copyWith(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ]),
                              const SizedBox(
                                height: 20
                              ),
                              Row(children: [
                                Text(
                                    "Tanggal pembuatan:  ${DateFormat('yyyy-MM-dd').format(snapshot.data[index].fields.date)}")
                              ]),
                              const SizedBox(
                                height: 20
                              ),
                              Row(children: [
                                Text(
                                    snapshot.data![index].fields.description)
                              ]),
                                        ]),
                                      ))))),
                    
                  );
                })
          ],
        ));
  }
}
