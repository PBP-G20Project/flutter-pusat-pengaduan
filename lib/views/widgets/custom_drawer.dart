import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/pusat_pengaduan_app.dart';
import 'package:pusat_pengaduan/utils/route.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.title, required this.menu});

  final String title;
  final Map<String, void Function()?> menu;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    logout() async {
      final response =
          await request.logout("http://127.0.0.1:8000/auth/logout/");
      is_user = false;
      return response;
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          for (var item in menu.entries)
            ListTile(
              title: Text(item.key),
              onTap: item.key == kLogout
                  ? () {
                      logout();
                      Get.offNamed(loginRoute);
                    }
                  : item.value,
              textColor: item.key == kLogout ? kErrorColor : kPrimaryColor,
            ),
        ],
      ),
    );
  }
}
