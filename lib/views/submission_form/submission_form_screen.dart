import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/models/report/report.dart';
import 'package:pusat_pengaduan/views/submission_form/controller/submission_form_controller.dart';
import 'package:pusat_pengaduan/views/submission_form/widgets/custom_dropdown.dart';
import 'package:pusat_pengaduan/views/submission_form/widgets/custom_footer_button.dart';
import 'package:pusat_pengaduan/views/submission_form/widgets/custom_textfield.dart';

class SubmissionFormScreen extends StatelessWidget {
  const SubmissionFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SubmissionFormController>();
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Laporan'),
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
                  hint: "Tuliskan judul laporan",
                  controller: controller.titleController.value,
                  validator: controller.validateTextField,
                ),
                const SizedBox(height: kDefaultPadding),
                CustomTextField(
                  label: "Isi Laporan",
                  hint: "Tuliskan isi laporan",
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  controller: controller.contentController.value,
                  validator: controller.validateTextField,
                ),
                const SizedBox(height: kDefaultPadding),
                CustomTextField(
                  label: "Instansi Terkait",
                  hint: "Tuliskan intansi terkait",
                  controller: controller.instansiController.value,
                  validator: controller.validateTextField,
                ),
                const SizedBox(height: kDefaultPadding),
                CustomDropdownField(
                    label: "Tingkat Instansi",
                    hint: "Pilih tingkat instansi",
                    validator: controller.validateTextField,
                    items: const [
                      "Nasional",
                      "Provinsi",
                      "Kabupaten/Kota",
                      "Kecamatan",
                      "Desa/Kelurahan"
                    ],
                    onChanged: (value) {
                      controller.tipeController.value.text = value!;
                    }),
                const SizedBox(height: kDefaultPadding),
                CustomTextField(
                  label: "Pihak yang Terlibat",
                  hint: "Tuliskan nama/jabatan pihak yang terlibat",
                  controller: controller.pihakController.value,
                  validator: controller.validateTextField,
                ),
                const SizedBox(height: kDefaultPadding),
                CustomTextField(
                  label: "Lokasi",
                  hint: "Tuliskan lokasi kejadian",
                  controller: controller.lokasiController.value,
                  validator: controller.validateTextField,
                ),
                const SizedBox(height: kDefaultPadding),
                Obx(() => CustomTextField(
                    label: "Tanggal",
                    hint: "Tuliskan tanggal kejadian",
                    keyboardType: TextInputType.none,
                    controller: controller.dateController.value,
                    validator: controller.validateTextField,
                    icon: const Icon(Icons.calendar_today),
                    onTap: () {
                      controller.chooseDate(context: context);
                    })),
                const SizedBox(height: kDefaultPadding),
                Obx(() => CheckboxListTile(
                      subtitle: const Text(
                          'Saya menyatakan bahwa laporan yang saya buat ini benar, tidak ada unsur manipulasi di dalamnya, dan saya akan bertanggung jawab sepenuhnya terhadap laporan ini'),
                      value: controller.isAgree.value,
                      onChanged: (value) {
                        controller.isAgree.value = value!;
                      },
                      activeColor: kPrimaryColor,
                      isThreeLine: true,
                    )),
              ],
            ),
          ),
        ),
      ]),
      persistentFooterButtons: [
        // Pernyataan Integritas
        CustomFooterButton(
          label: 'Submit',
          onPressed: () async {
            controller.submitForm();
            var data = reportToJson(controller.report);
            final response = await request.post(
                'https://pusat-pengaduan.up.railway.app/submission_form/json/',
                data);
            print(response);
            controller.clearForm();
            Get.back();
          },
        ),
      ],
    );
  }
}
