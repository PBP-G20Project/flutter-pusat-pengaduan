import 'package:flutter/material.dart';
import 'package:pusat_pengaduan/common/constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          Center(child: Image.asset('assets/icons/splash_icon.png', scale: 1.5,)),
          Positioned(
            left: 0,
            right: 0,
            bottom: kDefaultPadding * 2,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pusat',
                      style: kRubikBold.copyWith(
                        color: kWhiteColor,
                        fontSize: kDefaultPadding,
                      ),
                    ),
                    Text(
                      'Pengaduan',
                      style: kRubikBold.copyWith(
                        color: kSecondaryColor02,
                        fontSize: kDefaultPadding,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: kDefaultPadding / 5),
                Text(
                  'Developed by PBP',
                  style: kMerriweather.copyWith(
                    color: kWhiteColor.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(
              color: kSecondaryColor03,
              backgroundColor: kSecondaryColor02,
            ),
          ),
        ],
      ),
    );
  }
}
