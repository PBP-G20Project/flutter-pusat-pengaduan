
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pusat_pengaduan/views/dashboard/dashboard_admin/dashboard_admin_data.dart';


Future<List<AdminReport>> getAllStatus(request) async {
  final response = await request.get("https://pusat-pengaduan.up.railway.app/dashboard_admin/show_all_report/");

  // decoding response into json

  // json to AdminReport
  List<AdminReport> adminReport = [];
  for (var d in response) {
    if (d != null) {
      adminReport.add(AdminReport.fromJson(d));
    }
  }

  return adminReport;
}