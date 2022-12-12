import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_user/laporan_card.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_user/controller/dashboard_user_controller.dart';

const List<String> items = <String>[
  'Semua Laporan',
  'Laporan Pending',
  'Laporan Diproses',
  'Laporan Selesai',
  'Laporan Ditolak',
  'Draft'
];
String? selectedValue;

class DashboardUserScreen extends StatefulWidget {
  const DashboardUserScreen({super.key});

  @override
  State<DashboardUserScreen> createState() => _DashboardUserScreen();
}

class _DashboardUserScreen extends State<DashboardUserScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardUserController>();
    final ButtonStyle elevatedStyle = ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        backgroundColor: kWhiteColor);
    return Scaffold(
        backgroundColor: kSecondaryColor01,
        appBar: AppBar(
          title: Text('Dashboard User',
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
        body:ListView( 
            padding: const EdgeInsets.all(25),
            children: [
             Column(children: [

                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 140,
                    child: ElevatedButton.icon(
                        style: elevatedStyle,
                        onPressed: () => controller.navigateToDraft(),
                        icon: const Icon(Icons.add_circle_outline_rounded,
                            color: kBlackColor),
                        label: Text('Buat Draft',
                            style: kRubik.copyWith(
                              fontSize: 14,
                              color: kBlackColor,
                            ))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomDropdownButton2(
                    hint: 'Filter Laporan',
                    dropdownItems: items,
                    value: selectedValue,
                    buttonWidth: 155,
                    dropdownWidth: 150,
                    dropdownDecoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(14)),
                    buttonDecoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(14)),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  )
                ],
              ),
            const SizedBox(
                    height: 20,
                  ),
            // ElevatedButton(onPressed: null, child: null ),
            CardScreen(),

            ])
            ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Padding(
            padding: const EdgeInsets.all(24.0),
            child: FloatingActionButton.extended(
              onPressed: () => controller.navigateToForm(),
              tooltip: 'Buat Laporan',
              label: Text('Buat Laporan',
                  style: kRubik.copyWith(
                    fontSize: 14,
                    color: kBlackColor,
                  )),
              icon: const Icon(Icons.add_circle_outline_rounded,
                  color: kBlackColor),
              backgroundColor: kWhiteColor,
            )));
  }
}
