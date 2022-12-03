import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/views/submission_form/controller/submission_form_controller.dart';
import 'package:pusat_pengaduan/views/submission_form/widgets/custom_dropdown.dart';
import 'package:pusat_pengaduan/views/submission_form/widgets/custom_footer_button.dart';
import 'package:pusat_pengaduan/views/submission_form/widgets/custom_textfield.dart';

class SubmissionFormScreen extends StatelessWidget {
  const SubmissionFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SubmissionFormController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Laporan'),
      ),
      body: ListView(children: [
        Container(
          margin: const EdgeInsets.all(kDefaultPadding),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.formKey,
            child: Column(
              children: [
                const CustomTextField(
                    label: "Judul Laporan", hint: "Tuliskan judul laporan"),
                const SizedBox(height: kDefaultPadding),
                const CustomTextField(
                  label: "Isi Laporan",
                  hint: "Tuliskan isi laporan",
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(height: kDefaultPadding),
                const CustomTextField(
                    label: "Instansi Terkait",
                    hint: "Tuliskan intansi terkait"),
                const SizedBox(height: kDefaultPadding),
                CustomDropdownField(
                    label: "Tingkat Instansi",
                    hint: "Pilih tingkat instansi",
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
                const CustomTextField(
                    label: "Pihah yang Terlibat",
                    hint: "Tuliskan nama/jabatan pihak yang terlibat"),
                const SizedBox(height: kDefaultPadding),
                const CustomTextField(
                    label: "Lokasi", hint: "Tuliskan lokasi kejadian"),
                const SizedBox(height: kDefaultPadding),
                Obx(() => CustomTextField(
                    label: "Tanggal",
                    hint: "Tuliskan tanggal kejadian",
                    keyboardType: TextInputType.none,
                    controller: controller.dateController.value,
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
          onPressed: () {
            controller.formKey.currentState!.validate();
          },
        ),
      ],
    );
  }
}
