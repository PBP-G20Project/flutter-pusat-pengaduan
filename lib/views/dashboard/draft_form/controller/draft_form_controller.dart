import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:pusat_pengaduan/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/models/profile/profile_model.dart';
import 'package:pusat_pengaduan/views/dashboard/draft_form/models/draft_model.dart';

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
  final dateController = TextEditingController().obs;
  final scrollController = ScrollController();
  late DraftUser fields;

  String? validateTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field tidak boleh kosong';
    }
    return null;
  }

  validateForm(request) async {
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

  getDataForm(request) async {
    var user = await getUserId(request);
    var title = titleController.value.text;
    var description = contentController.value.text;

    fields = DraftUser(
        user: user,
        title: title,
        description: description,
        date: DateTime.now());
  }

  getUserId(request) async {
    final response =
        await request.get("https://localhost:8000/auth/data_login/");
    if (response[0] == null) {
      return {"status": false};
    } else {
      User user = User.fromJson(response[0]);
      return user.pk;
    }
  }
}
