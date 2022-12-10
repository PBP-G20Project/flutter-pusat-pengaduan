import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/utils/route.dart';
import 'package:pusat_pengaduan/views/home/home_page/controller/home_page_controller.dart';
import 'package:pusat_pengaduan/views/home/review/review_screen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  getReview(request) async {
    final response =
        await request.get("https://pusat-pengaduan.up.railway.app/");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    // get controller
    final controller = Get.find<HomePageController>();
    final request = context.watch<CookieRequest>();

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text('Pusat Pengaduan',
            style: kRubik.copyWith(
              fontSize: 18,
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/images/palu.png',
            width: 300,
            height: 300,
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 400, 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kWhiteColor,
                  minimumSize: const Size(120, 40),
                  maximumSize: const Size(120, 40),
                ),
                onPressed: () => controller
                    .navigateToLogin(), // contoh penggunaan navigator pushNamed dengan getx
                child: const Text('Login',
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.w500))),
          ),

          Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 400, 10),
              child: const Text(
                "Berita",
                style: TextStyle(fontSize: 20, color: kWhiteColor),
              )),
          GestureDetector(
            onTap: () => controller.navigateToBeritaDetailTiga(),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 4,
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                            'Jaksa menjelaskan alasan Benny Tjokro dituntut pidana mati, salah satunya karena sebelumnya telah terlibat dalam kasus Jiwasraya hingga merugikan ASN Kementerian Pertahanan.'),
                      ]),
                )),
          ),
          GestureDetector(
            onTap: () => controller.navigateToBeritaDetail(),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 4,
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                            'Direktur Sosialisasi dan Kampanye Antikorupsi Komisi Pemberantasan Korupsi ( KPK ), Amir Arief menyoroti tingginya angka korupsi di sektor politik.'),
                      ]),
                )),
          ),
          GestureDetector(
            onTap: () => controller.navigateToBeritaDetailDua(),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 4,
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                            'Harun Masiku seperti lenyap ditelan bumi. Politisi PDIP ini tak menampakkan diri di depan publik sejak komisioner KPU, Wahyu Setiawan ditangkap penyidik KPK Rabu 8 Januari lalu.'),
                      ]),
                )),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 400, 10),
            child: ElevatedButton(
                onPressed: () => controller.navigateToReviewForm(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kWhiteColor,
                  minimumSize: const Size(120, 40),
                  maximumSize: const Size(120, 40),
                ), // contoh penggunaan navigator pushNamed dengan getx
                child: const Text('Review',
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.w500))),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 400, 20),
            child: ElevatedButton(
                onPressed: () => controller.navigateToBeritaDetail(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kWhiteColor,
                  minimumSize: const Size(120, 40),
                  maximumSize: const Size(120, 40),
                ), // contoh penggunaan navigator pushNamed dengan getx
                child: const Text('Lapor',
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.w500))),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 400, 100),
              child: const Text(
                "Review",
                style: TextStyle(fontSize: 20, color: kWhiteColor),
              )),
          // FutureBuilder(future: getReview(request),
          // builder: (context, AsyncSnapshot snapshot) {
          //       if (snapshot.data == null) {
          //         return const Center(child: CircularProgressIndicator());
          //       } else {
          //         if (!snapshot.hasData) {
          //           return Column(
          //             children: const [
          //               Text("No Review Yet!", style: TextStyle(
          //                 color: kWhiteColor,
          //                 fontSize: 15
          //               ),),
          //               SizedBox(height: 8,)
          //             ],
          //           );
          //         } else {
          //           return ListView.builder(itemBuilder:
          //           )
          //         }
          //       }
          // },),
          // Container(
          //   child: ListView.builder(
          //     itemCount: controller.data!.length,
          //     itemBuilder: (_, index) => Container(
          //       padding: EdgeInsets.fromLTRB(20, 0, 400, 100),
          //       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          //       decoration: BoxDecoration(
          //         color: kWhiteColor,
          //         borderRadius: BorderRadius.circular(15.0),
          //         boxShadow: const [
          //           BoxShadow(
          //             color: kPrimaryColor,
          //             blurRadius: 2.0
          //           )
          //         ]
          //       ),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: const [
          //           Text(
          //             "Anon", style: const TextStyle(
          //             fontSize: 15.0,
          //             fontWeight: FontWeight.bold
          //           ),
          //           ),
          //           const SizedBox(height: 10,),
          //           Text("controller.data"),
          //         ],
          //       ),
          //     ),
          //
          //       ),
          // )
        ],
      ),
    );
  }
}
