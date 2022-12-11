import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/models/report/report.dart';

class SubmissionFormController extends GetxController {
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    titleController.value.dispose();
    contentController.value.dispose();
    instansiController.value.dispose();
    tipeController.value.dispose();
    pihakController.value.dispose();
    lokasiController.value.dispose();
    dateController.value.dispose();
    super.dispose();
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
  var dateTime = DateTime.now();
  var report;

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
      getDataForm();
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

  clearForm() {
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

  getDataForm() {
    // TODO: Implement post report
    var userSubmission = 0;
    var adminSubmission = 0;
    var pk = 0;
    var title = titleController.value.text;
    var content = contentController.value.text;
    var institution = instansiController.value.text;
    var institutionLevel = tipeController.value.text;
    var involvedParty = pihakController.value.text;
    var location = lokasiController.value.text;

    var fields = Fields(
        userSubmission: userSubmission,
        adminSubmission: adminSubmission,
        title: title,
        content: content,
        institution: institution,
        institutionLevel: institutionLevel,
        involvedParty: involvedParty,
        date: dateTime,
        location: location,
        status: "PENDING");

    report = Report(fields: fields, pk: pk);
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
      dateTime = date;
    }
    return null;
  }
}
