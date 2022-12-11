import 'package:flutter/material.dart';
import 'package:pusat_pengaduan/common/constant.dart';

class BeritaDetailScreen extends StatelessWidget {
  const BeritaDetailScreen({super.key});

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
            child: const Text('KPK Sebut 600 Politisi Terjerat Korupsi',
                style: TextStyle(color: kWhiteColor, fontSize: 20)),
          ),
        ),
        Image.asset(
          'assets/images/korupsi1.jpg',
          width: 300,
          height: 300,
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: const Text(
              ' JAKARTA - Direktur Sosialisasi dan Kampanye Antikorupsi Komisi Pemberantasan Korupsi ( KPK ), Amir Arief menyoroti tingginya angka korupsi di sektor politik. Berdasarkan data yang dikantongi KPK hingga Januari 2022, ada sekitar 600 politisi , yang meliputi anggota legislatif hingga kepala daerah, terjerat kasus korupsi. Data itu dibeberkan Amir saat mengikuti acara Kick Off Road to Anti-Corruption Summit (ACS) ke-5 yang digelar KPK menggandeng sejumlah perguruan tinggi. Dalam kesempatan itu, Amir berharap ada pembenahan di sektor politik karena rawan terjadi celah pidana korupsi. "Kita bisa melihat statistik penindakan yang dilakukan KPK hingga Januari 2022, begitu banyak politisi yang terjerat tindak pidana korupsi, kalau ditotal ada sekitar 600 politisi dari anggota DPR & DPRD, Gubernur, Bupati, Wali Kota. Hal itu yang harus kita benahi bersama," kata Amir, Minggu (11/9/2022). Menurut Amir, pembenahan sektor politik dari celah korupsi dapat berjalan optimal jika melibatkan berbagai pihak, termasuk perguruan tinggi. Hal itu disambut positif oleh Rektor Universitas Muhammadiyah Surabaya, Sukadiono. "Kami selaku akademisi, orang yang berkecimpung di dunia pendidikan, tentu sangat senang ketika dilibatkan oleh KPK untuk menjadi bagian dalam mencegah terjadinya korupsi di berbagai bidang yang terlihat di masyarakat, termasuk sektor politik," ujar Sukadiono. Sementara itu, Wakil Ketua KPK Nurul Gufron berharap agar kegiatan yang diselenggarakan lembaganya dapat mendorong perguruan tinggi melakukan penemuan serta pengetahuan baru dalam pemberantasan korupsi, sehingga berbagai potensi korupsi dapat dicegah dan ditangani melalui penemuan pengetahuan baru. "Itulah kami berharap, ada sumbangsih perguruan tinggi dalam hal pengembangan ilmu pemberantasan korupsi. Kami juga berharap agar perguruan tinggi menjadi percontohan tata kelola keuangan dan governance yang baik, sehingga dapat dipercaya oleh publik," ujar Ghufron.',
              style: TextStyle(color: kWhiteColor),
            ),
          ),
        )
      ]),
    );
  }
}
