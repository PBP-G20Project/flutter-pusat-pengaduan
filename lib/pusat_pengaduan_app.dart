import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/utils/route.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class PusatPengaduanApp extends StatelessWidget {
  const PusatPengaduanApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: kDarkPrimaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: GetMaterialApp(
        title: "Pusat Pengaduan",
        debugShowCheckedModeBanner: false,
        theme: Theme.of(context).copyWith(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: kPrimaryColor,
            onPrimary: kWhiteColor,
            secondary: kSecondaryColor01,
            onSecondary: kSecondaryColor02,
            error: kErrorColor,
            onError: kWhiteColor,
            background: kBananaColor200,
            onBackground: kPrimaryColor,
            surface: kMintColor,
            onSurface: kPrimaryColor,
          ),
          textTheme: GoogleFonts.rubikTextTheme(),
        ),
        getPages: route,
        initialRoute: splashRoute,
      ),
    );
  }
}
