import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/views/dashboard/draft_form/controller/draft_form_controller.dart';
import 'package:pusat_pengaduan/views/dashboard/draft_form/widgets/custom_footer_button.dart';
import 'package:pusat_pengaduan/views/dashboard/draft_form/widgets/custom_textfield.dart';

class DraftFormScreen extends StatelessWidget {
  const DraftFormScreen({super.key});

  reportPost(request, data) async {
    final response = await request.post(
        'https://localhost:8000/dashboard_user/Draft/', jsonEncode(data));
    return response;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final controller = Get.find<DraftFormController>();
    return Scaffold(
      backgroundColor: kSecondaryColor01,
      appBar: AppBar(
        title: Text('Draft Laporan',
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
      body: ListView(controller: controller.scrollController, children: [
        Container(
          margin: const EdgeInsets.all(kDefaultPadding),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: controller.formKey,
            child: Column(
              children: [
                CustomTextField(
                  label: "Judul Laporan",
                  labelStyle: const TextStyle(color: kWhiteColor),
                  hint: "Tuliskan judul laporan",
                  controller: controller.titleController.value,
                  validator: controller.validateTextField,
                ),
                const SizedBox(height: kDefaultPadding),
                CustomTextField(
                  label: "Isi Laporan",
                  labelStyle: const TextStyle(color: kWhiteColor),
                  hint: "Tuliskan isi laporan",
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  controller: controller.contentController.value,
                  validator: controller.validateTextField,
                ),
              ],
            ),
          ),
        )
      ]),
      persistentFooterButtons: [
        // Pernyataan Integritas
        CustomFooterButton(
          label: 'Submit',
          onPressed: () async {
            if (await controller.validateForm(request)) {
              print(2);
              var data = controller.fields.toJson();
              reportPost(request, data);
            }
          },
        ),
      ],
    );
  }
}
