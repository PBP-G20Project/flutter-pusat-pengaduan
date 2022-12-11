import 'package:flutter/material.dart';
import 'package:pusat_pengaduan/common/constant.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.title, required this.menu});

  final String title;
  final Map<String, void Function()?> menu;

  @override
  Widget build(BuildContext context) {
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
              onTap: item.value,
              textColor: item.key == kLogout ? kErrorColor : kPrimaryColor,
            ),
        ],
      ),
    );
  }
}
