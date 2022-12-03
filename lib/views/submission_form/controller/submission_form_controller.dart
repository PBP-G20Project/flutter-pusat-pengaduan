import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
  var isAgree = false.obs;

  chooseDate({required BuildContext context}) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (date != null) {
      dateController.value.text = DateFormat.yMd().format(date);
    }
    return null;
  }
}
