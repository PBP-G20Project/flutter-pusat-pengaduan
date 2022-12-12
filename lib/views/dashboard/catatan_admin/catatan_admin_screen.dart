import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_admin/widget/custom_dropdown.dart';

import '../../submission_form/widgets/custom_footer_button.dart';
import '../../submission_form/widgets/custom_textfield.dart';
import 'catatan_admin_data.dart';
import 'controller/catatan_admin_controller.dart';

class CatatanAdminScreen extends StatefulWidget {
  const CatatanAdminScreen({super.key});

  @override
  State<CatatanAdminScreen> createState() => _CatatanAdminScreenState();
}

class _CatatanAdminScreenState extends State<CatatanAdminScreen> {

  final _formKey = GlobalKey<FormState>();
  String _title = "";
  String _content = "";
  String _status = "";


  Future<List<AdminReminder>> getAllStatus(request) async {
    final response = await request.get(
        "https://pusat-pengaduan.up.railway.app/dashboard_admin/get_reminder_json/");
    // json to AdminReminder
    List<AdminReminder> adminReminder = [];
    for (var d in response) {
      if (d != null) {
        adminReminder.add(AdminReminder.fromJson(d));
      }
    }
    return adminReminder;
  }

  reminderPost(request) async {
    final response = await request.post(
        'https://pusat-pengaduan.up.railway.app/dashboard_admin/create_reminder/',
        {'title': _title, 'content': _content, 'status': _status});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CatatanAdminController>();
    final request = context.watch<CookieRequest>();



    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Admin'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(kDefaultPadding),
            child: Form(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    label: "Judul Laporan",
                    hint: "Tuliskan judul laporan",
                    controller: controller.titleController.value,
                    validator: controller.validateTextField,
                    onChanged: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                  ),
                  const SizedBox(height: kDefaultPadding),
                  CustomTextField(
                    label: "Isi Laporan",
                    hint: "Tuliskan isi laporan",
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    controller: controller.contentController.value,
                    validator: controller.validateTextField,
                    onChanged: (String? value) {
                      setState(() {
                        _content = value!;
                      });
                    },
                  ),
                  const SizedBox(height: kDefaultPadding),
                  CustomDropdownField(
                      label: "Sentimen",
                      hint: "Pilih status reminder",
                      validator: controller.validateTextField,
                      items: const [
                        "Positif",
                        "Negatif",
                      ],
                      onChanged: (value) {
                        _status = value!;
                      }),
                  const SizedBox(height: kDefaultPadding),
                ],
              ),
            ),
          ),
          CustomFooterButton(
            label: 'Submit',
            onPressed: () async {
              // if (await controller.validateForm(request)) {
              //   var data = controller.fields.toJson();
              //   var response = await reminderPost(request);
              //   if (response["status"] == "success") {
              //     controller.successSubmit();
              //   } else {
              //     controller.errorSnackbar();
              //   }
              // }
              if (_formKey.currentState!.validate()){
                reminderPost(request).then((result){
                  controller.successSubmit();
                });
              } else {
                controller.errorSnackbar();
              }
            },
          ),
          Expanded(
            child: FutureBuilder(
                future: getAllStatus(request),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Text('Mohon Menunggu Data Fetching');
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
                                            'Positif') ? kSuccessColor :
                                        kErrorColor,
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
                })
          ),
        ],
      ),
    );
  }
}
