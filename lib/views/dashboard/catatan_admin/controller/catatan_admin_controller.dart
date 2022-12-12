import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusat_pengaduan/common/constant.dart';

import '../../../../utils/route.dart';
import '../catatan_admin_data.dart';

class CatatanAdminController extends GetxController{
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  final formKey = GlobalKey<FormState>();
  final scrollController = ScrollController();
  final titleController = TextEditingController().obs;
  final contentController = TextEditingController().obs;
  final newStatusController = TextEditingController().obs;
  final statusController = TextEditingController().obs;
  late AdminReminder fields;

  scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  String? validateTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field tidak boleh kosong';
    }
    return null;
  }

  validateForm(request) async {
    Get.snackbar("Error", "Harap isi semua field",
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(kDefaultPadding / 2),
        backgroundColor: kErrorColor,
        colorText: kWhiteColor,
        icon: const Icon(
          Icons.error_outline_rounded,
          color: kWhiteColor,
        ));

    return false;
  }

  getDataForm(request) async {
    var title = titleController.value.text;
    var content = contentController.value.text;
    var status = newStatusController.value.text;

    fields = Fields(
      admin: null,
      title: title,
      content: content,
      status: status,
    ) as AdminReminder;
  }

  successSubmit() {
    Get.snackbar("Success", "Reminder berhasil dikirim",
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(kDefaultPadding / 2),
        backgroundColor: kSuccessColor,
        colorText: kWhiteColor,
        icon: const Icon(
          Icons.check_circle_outline,
          color: kWhiteColor,
        ));
    Get.offNamed(dashboardAdminRoute);
  }

  errorSnackbar() {
    Get.snackbar(
        "Error", "Terjadi error saat mengirim laporan, coba lagi nanti",
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(kDefaultPadding / 2),
        backgroundColor: kErrorColor,
        colorText: kWhiteColor,
        icon: const Icon(
          Icons.error_outline_rounded,
          color: kWhiteColor,
        ));
  }

  reportPost(request, data) async {
    final response = await request.post(
        'https://pusat-pengaduan.up.railway.app/submission_form//',
        jsonEncode(data));
    return response;
  }
}