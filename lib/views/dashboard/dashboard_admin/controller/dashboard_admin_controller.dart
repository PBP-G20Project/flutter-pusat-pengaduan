import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pusat_pengaduan/common/constant.dart';

class DashboardAdminController extends GetxController{
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  final _formKey = GlobalKey<FormState>();
  final scrollController = ScrollController();
  final statusController = TextEditingController().obs;


  scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }


}