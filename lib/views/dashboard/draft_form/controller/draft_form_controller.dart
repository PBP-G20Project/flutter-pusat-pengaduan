import 'package:get/get.dart';
import 'package:pusat_pengaduan/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pusat_pengaduan/common/constant.dart';

class DraftFormController extends GetxController {
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  navigateToProfile() {
    Get.toNamed(profileRoute);
  }

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController().obs;
  final contentController = TextEditingController().obs;
  final scrollController = ScrollController();

  String? validateTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field tidak boleh kosong';
    }
    return null;
  }

  validateForm() {
    if (formKey.currentState!.validate()) {
      Get.snackbar("Succes", "Laporan berhasil dikirim",
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.all(kDefaultPadding / 2),
          backgroundColor: kSuccessColor,
          colorText: kWhiteColor,
          icon: const Icon(
            Icons.check_circle_outline,
            color: kWhiteColor,
          ));
      return true;
    } else {
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
    }
    return false;
  }

  submitform() {
    if (validateForm()) {
      formKey.currentState!.reset();
      titleController.value.clear();
      contentController.value.clear();
    }
  }
}
