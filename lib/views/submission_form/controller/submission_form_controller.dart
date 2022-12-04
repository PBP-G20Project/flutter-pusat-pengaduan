import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pusat_pengaduan/common/constant.dart';

class SubmissionFormController extends GetxController {
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController().obs;
  final contentController = TextEditingController().obs;
  final instansiController = TextEditingController().obs;
  final tipeController = TextEditingController().obs;
  final pihakController = TextEditingController().obs;
  final lokasiController = TextEditingController().obs;
  final dateController = TextEditingController().obs;
  final scrollController = ScrollController();
  var isAgree = false.obs;

  String? validateTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field tidak boleh kosong';
    }
    return null;
  }

  scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  validateForm() {
    if (formKey.currentState!.validate() && isAgree.value) {
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
    } else if (!isAgree.value && !formKey.currentState!.validate()) {
      Get.snackbar("Error", "Harap isi semua field dan setujui persyaratan",
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.all(kDefaultPadding / 2),
          backgroundColor: kErrorColor,
          colorText: kWhiteColor,
          icon: const Icon(
            Icons.error_outline_rounded,
            color: kWhiteColor,
          ));
    } else if (!isAgree.value) {
      scrollDown();
      Get.snackbar("Error", "Harap setujui persyaratan",
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.all(kDefaultPadding / 2),
          backgroundColor: kErrorColor,
          colorText: kWhiteColor,
          icon: const Icon(
            Icons.error_outline_rounded,
            color: kWhiteColor,
          ));
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

  submitForm() {
    if (validateForm()) {
      postReport();
      print("Title: ${titleController.value.text}");
      print("Content: ${contentController.value.text}");
      print("Instansi: ${instansiController.value.text}");
      print("Tipe: ${tipeController.value.text}");
      print("Pihak: ${pihakController.value.text}");
      print("Lokasi: ${lokasiController.value.text}");
      print("Date: ${dateController.value.text}");

      formKey.currentState!.reset();
      titleController.value.clear();
      contentController.value.clear();
      instansiController.value.clear();
      tipeController.value.clear();
      pihakController.value.clear();
      lokasiController.value.clear();
      dateController.value.clear();
      isAgree.value = false;
    }
  }

  postReport() {
    // TODO: Implement post report
  }

  chooseDate({required BuildContext context}) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (date != null) {
      dateController.value.text = DateFormat('dd/MM/yyyy').format(date);
    }
    return null;
  }
}
