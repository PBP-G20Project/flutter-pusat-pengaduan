import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/views/dashboard/draft_form/controller/draft_form_controller.dart';
import 'package:pusat_pengaduan/views/dashboard/draft_form/widgets/custom_footer_button.dart';
import 'package:pusat_pengaduan/views/dashboard/draft_form/widgets/custom_textfield.dart';

class DraftFormScreen extends StatefulWidget {
  const DraftFormScreen({super.key});

  @override
  State<DraftFormScreen> createState() => _DraftFormState();
}

class _DraftFormState extends State<DraftFormScreen> {
  final controller = Get.find<DraftFormController>();
  final _formKey = GlobalKey<FormState>();

  String _title = "";

  String _description = '';

  draftPost(request) async {
    final response = await request.post(
        'https://pusat-pengaduan.up.railway.app/dashboard_user/Draft/',
        {'title': _title, 'description': _description});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Draft',
            style: kRubik.copyWith(
              fontSize: 18,
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor)),
                    hintText: "Judul Draft",
                    labelText: "Judul Draft",
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _title = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _title = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Judul tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                
                child: TextFormField(
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor)),
                    hintText: "Deskripsi Draft",
                    labelText: "Deskripsi Draft",
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              TextButton(
                  onPressed: () async {
                    draftPost(request).then((result) {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Berhasil menambahkan draft',
                                      style: TextStyle(color: Colors.green)),
                                  content: const Text("Draft Berhasil Disimpan"),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () =>
                                            controller.navigateToHomePage(),
                                        child: const Text("OK")),
                                  ],
                                ));
                
                    });
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: kPrimaryColor),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
// class DraftFormScreen extends StatefulWidget {
//   const DraftFormScreen({super.key});

//   reportPost(request, data) async {
//     final response = await request.post(
//         'https://pusat-pengaduan.up.railway.app/dashboard_user/Draft/',{

//         });
//     return response;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final request = context.watch<CookieRequest>();
//     final controller = Get.find<DraftFormController>();
//     return Scaffold(
//       backgroundColor: kSecondaryColor01,
//       appBar: AppBar(
//         title: Text('Draft Laporan',
//             style: kRubik.copyWith(
//               fontSize: 18,
//               color: kWhiteColor,
//               fontWeight: FontWeight.bold,
//             )),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.person_outline),
//             tooltip: 'Profile',
//             onPressed: () => controller.navigateToProfile(),
//           )
//         ],
//       ),
//       body: ListView(controller: controller.scrollController, children: [
//         Container(
//           margin: const EdgeInsets.all(kDefaultPadding),
//           child: Form(
//             autovalidateMode: AutovalidateMode.always,
//             key: controller.formKey,
//             child: Column(
//               children: [
//                 CustomTextField(
//                   label: "Judul Laporan",
//                   labelStyle: const TextStyle(color: kWhiteColor),
//                   hint: "Tuliskan judul laporan",
//                   controller: controller.titleController.value,
//                   validator: controller.validateTextField,
//                 ),
//                 const SizedBox(height: kDefaultPadding),
//                 CustomTextField(
//                   label: "Isi Laporan",
//                   labelStyle: const TextStyle(color: kWhiteColor),
//                   hint: "Tuliskan isi laporan",
//                   maxLines: 5,
//                   keyboardType: TextInputType.multiline,
//                   controller: controller.contentController.value,
//                   validator: controller.validateTextField,
//                 ),
//               ],
//             ),
//           ),
//         )
//       ]),
//       persistentFooterButtons: [
//         // Pernyataan Integritas
//         CustomFooterButton(
//           label: 'Submit',
//           onPressed: () async {
            
            
//           },
//         ),
//       ],
//     );
//   }
// }
