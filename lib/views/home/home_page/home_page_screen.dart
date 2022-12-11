import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:pusat_pengaduan/common/constant.dart';

import 'package:pusat_pengaduan/views/home/home_page/controller/home_page_controller.dart';

import 'package:pusat_pengaduan/views/home/review/review_model.dart';
import 'package:pusat_pengaduan/controller/route_controller.dart';
import 'package:pusat_pengaduan/views/widgets/custom_drawer.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  getReview(request) async {
    final response = await request
        .get("https://pusat-pengaduan.up.railway.app/json_review/");
    // print(response);
    List<Review> listReview = [];
    for (var i in response) {
      if (i != null) {
        listReview.add(Review.fromJson(i));
      }
    }
    // print(response[0]);
    // Review re = Review.fromJson(response[0]);
    // print(re);
    // print(listReview);
    return listReview;
  }

  @override
  Widget build(BuildContext context) {
    // get controller
    final request = context.watch<CookieRequest>();
    final controller = Get.find<HomePageController>();

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
      drawer: CustomDrawer(
        title: 'Pusat Pengaduan',
        menu: RouteController.getDrawerRoute(kHome, request),
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/images/palu.png',
            width: 300,
            height: 300,
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
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 4,
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/images/korupsi3.jpg",
                          height: 80,
                          width: 150,
                        ),
                        const Flexible(
                          child: Text(
                            'Jaksa menjelaskan alasan Benny Tjokro dituntut pidana mati, salah satunya karena sebelumnya telah terlibat dalam kasus Jiwasraya hingga merugikan ASN Kementerian Pertahanan.',
                          ),
                        )
                      ]),
                )),
          ),
          GestureDetector(
            onTap: () => controller.navigateToBeritaDetail(),
            child: Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 4,
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/images/korupsi1.jpg",
                          height: 80,
                          width: 150,
                        ),
                        const Flexible(
                          child: Text(
                              'Direktur Sosialisasi dan Kampanye Antikorupsi Komisi Pemberantasan Korupsi ( KPK ), Amir Arief menyoroti tingginya angka korupsi di sektor politik.'),
                        )
                      ]),
                )),
          ),
          GestureDetector(
            onTap: () => controller.navigateToBeritaDetailDua(),
            child: Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 4,
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/images/card1.jpg",
                          height: 80,
                          width: 150,
                        ),
                        const Flexible(
                          child: Text(
                              'Harun Masiku seperti lenyap ditelan bumi. Politisi PDIP ini tak menampakkan diri di depan publik sejak komisioner KPU, Wahyu Setiawan ditangkap penyidik KPK Rabu 8 Januari lalu.'),
                        )
                      ]),
                )),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 400, 20),
              child: const Text(
                "Review",
                style: TextStyle(fontSize: 20, color: kWhiteColor),
              )),
          FutureBuilder(
            future: getReview(request),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "No Review Yet!",
                        style: TextStyle(color: kWhiteColor, fontSize: 15),
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const [
                            BoxShadow(color: kPrimaryColor, blurRadius: 2.0)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${snapshot.data![index].fields.user}",
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("${snapshot.data![index].fields.comment}",
                              style: const TextStyle(fontSize: 15))
                        ],
                      ),
                    ),
                  );

                  // print(snapshot.data[0].fields.user);
                  // return Text("ini data");
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
