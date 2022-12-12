import 'package:flutter/material.dart';
import 'package:pusat_pengaduan/common/constant.dart';

class BeritaDetailDuaScreen extends StatelessWidget {
  const BeritaDetailDuaScreen({super.key});

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
                'Harun Masiku dan Mereka yang Hilang di Tengah Kasus Korupsi',
                style: TextStyle(color: kWhiteColor, fontSize: 20)),
          ),
        ),
        Image.asset(
          'assets/images/card1.jpg',
          width: 300,
          height: 300,
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: const Text(
              'Harun Masiku seperti lenyap ditelan bumi. Politisi Partai Demokrasi Indonesia Perjuangan (PDIP) ini tak pernah menampakkan diri di depan publik, sejak komisioner Komisi Pemilihan Umum (KPU) Wahyu Setiawan ditangkap oleh penyidik KPK, Rabu 8 Januari 2020 lalu. Sampai hari ini, tiga pekan berselang, keberadaan Harun tak diketahui. Ketua KPK, Firli Bahuri mengatakan, mencari seorang buronan tidak gampang. “Kayak mencari jarum dalam sekam,” katanya. Meskipun demikian, Firli memberi jaminan bahwa Harun pasti ditemukan. “Pasti ketangkap,” katanya. Kepolisian RI sudah pula menyiapkan tim khusus untuk membekuk Harun. Menteri Hukum dan Ham juga membentuk tim spesial untuk melacak kepulangan Harun ke Indonesia. "Ada yang janggal, (karena itu) harus tim,” kata Yasonna Laoly. “Kalau ‘tim-saya’ nanti orang tak percaya, maka saya sebut ‘tim-cyber-crime’, (anggotanya) dari Polri, Kemenkominfo yang sangat ahli, dari BSSN yang juga ahli, dan Ombudsman,” tambah Pak Menteri. Sebelumnya, Selasa (28/01/2020) Menteri Yasonna mencopot Ronny F. Sompie dari jabatannya sebagai Dirjen Imigrasi. Langkah ini dilakukan agar penyelidikan keterlambatan informasi kepulangan Harun, lebih mudah. “Supaya betul-betul independen, Dirjen Imigrasi difungsionalkan, sekarang dijabat Plh," kata Yasonna.',
              style: TextStyle(color: kWhiteColor),
            ),
          ),
        )
      ]),
    );
  }
}
