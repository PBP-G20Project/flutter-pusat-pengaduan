import 'package:pusat_pengaduan/views/dashboard/dashboard_user/models/dashboard_user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<List<LaporanUser>> fetchLaporan() async {
  var url = Uri.parse('https://pusat-pengaduan.up.railway.app/dashboard_user/Laporan/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object MyWatchlist
  List<LaporanUser> listLaporan = [];
  for (var d in data) {
    if (d != null) {
      listLaporan.add(LaporanUser.fromJson(d));
    }
  }

  return listLaporan;
}