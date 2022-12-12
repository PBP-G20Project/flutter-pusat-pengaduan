import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_user/laporan_card.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_user/controller/dashboard_user_controller.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/controller/route_controller.dart';
import 'package:pusat_pengaduan/views/widgets/custom_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';


const List<String> items = <String>['Semua Laporan', 'Draft'];
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
        body: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: 140,
                child: ElevatedButton.icon(
                    style: elevatedStyle,
                    onPressed: () => controller.navigateToDraftForm(),
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
              SizedBox(
                height: 40,
                width: 140,
                child: ElevatedButton.icon(
                    style: elevatedStyle,
                    onPressed: () => controller.navigateToDraft(),
                    icon: const Icon(Icons.find_in_page_rounded,
                        color: kBlackColor),
                    label: Text('Lihat Draft',
                        style: kRubik.copyWith(
                          fontSize: 14,
                          color: kBlackColor,
                        ))),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // ElevatedButton(onPressed: null, child: null ),

          const Expanded(
            child: CardScreen(),
          ),
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
