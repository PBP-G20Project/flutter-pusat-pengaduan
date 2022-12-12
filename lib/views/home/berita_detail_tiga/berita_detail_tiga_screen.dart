import 'package:flutter/material.dart';
import 'package:pusat_pengaduan/common/constant.dart';

class BeritaDetailTigaScreen extends StatelessWidget {
  const BeritaDetailTigaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: ListView(children: <Widget>[
        Center(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: const Text(
                'Alasan Benny Tjokro Dituntut Mati: Korupsi Berulang hingga Rugikan TNI',
                style: TextStyle(color: kWhiteColor, fontSize: 20)),
          ),
        ),
        Image.asset(
          'assets/images/korupsi3.jpg',
          width: 300,
          height: 300,
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: const Text(
              'Jakarta - Komisaris PT Hanson International Tbk Benny Tjokrosaputro dituntut hukuman pidana mati. Jaksa menjelaskan alasan Benny Tjokro dituntut pidana mati, salah satunya karena sebelumnya telah terlibat dalam kasus Jiwasraya hingga merugikan ASN Kementerian Pertahanan. "Bahwa dalam penjatuhan pidana, negara melalui peraturan perundang-undangan mengatur penjatuhan pidana mati bagi perbuatan-perbuatan pidana tertentu yang bersifat sangat luar biasa (extraordinary crime) yang tidak terlepas pada sifat kejahatan yang serius dan merusak nilai-nilai kemanusiaan dan keadilan," kata jaksa penuntut umum, Wagiyo, saat membacakan kesimpulan pada tuntutannya, Rabu (26/10/2022).  Hal Memberatkan yang Bikin Benny Tjokro Dituntut Mati di Kasus Asabri Diketahui, Benny Tjokro dinilai terbukti bersalah melakukan tindak pidana korupsi dalam skandal kasus PT ASABRI yang merugikan negara hingga Rp 22,7 triliun. Sebelumnya, Benny Tjokro pernah divonis hukuman seumur hidup dalam kasus korupsi PT Jiwasraya. Jaksa mengatakan dalam penjatuhan pidana mati diatur dalam kejahatan yang bersifat luar biasa atau extraordinary crime. Hal itu diatur dalam Pasal 2 ayat 2 Undang-Undang Nomor 31 Tahun 1999 sebagaimana telah diubah dengan Undang-Undang Nomor 20 Tahun 2001 tentang Pemberantasan Tindak Pidana Korupsi (selanjutnya disebut UU Tipikor). Pasal 2 ayat 2 Dalam hal tindak pidana korupsi sebagaimana dimaksud dalam ayat (1) dilakukan dalam keadaan tertentu, pidana mati dapat dijatuhkan. Jaksa mengatakan makna frasa "keadaan tertentu" sebagaimana dalam penjelasan Pasal 2 ayat (2) dalam UU Nomor 20 Tahun 2001, yaitu: "Yang dimaksud dengan "keadaan keadaan tertentu" dalam ketentuan ini adalah keadaan yang dapat dijadikan alasan pemberatan pidana bagi pelaku tindak pidana korupsi, yaitu apabila tindak pidana tersebut dilakukan terhadap dana-dana yang diperuntukkan bagi penanggulangan keadaan bahaya, bencana alam nasional, penanggulangan akibat kerusuhan sosial yang meluas, penanggulangan krisis ekonomi dan moneter, dan pengulangan tindak pidana korupsi," bunyi pasal tersebut. Lebih lanjut, jaksa mengatakan tidak ada penjelasan mengenai pengertian dari tiap keadaan tersebut sehingga penting memberikan pemahaman dan penjelasan dan batasan yang jelas tentang keadaan yang dimaksud, khususnya "pengulangan tindak pidana".',
              style: TextStyle(color: kWhiteColor),
            ),
          ),
        )
      ]),
    );
  }
}
