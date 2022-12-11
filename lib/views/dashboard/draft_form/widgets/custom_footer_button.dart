import 'package:flutter/material.dart';
import 'package:pusat_pengaduan/common/constant.dart';

class CustomFooterButton extends StatelessWidget {
  const CustomFooterButton(
      {Key? key, required this.label, required this.onPressed, this.width})
      : super(key: key);
  final String label;
  final Function() onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: 44,
      margin: const EdgeInsets.all(kDefaultPadding / 2),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kPrimaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)))),
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: kRubikBold.copyWith(
                  color: kWhiteColor,
                ),
              )
            ],
          )),
    );
  }
}