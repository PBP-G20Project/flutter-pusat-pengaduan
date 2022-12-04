import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusat_pengaduan/common/constant.dart';

class CustomDropdownField extends StatelessWidget {
  const CustomDropdownField(
      {Key? key,
      required this.label,
      required this.hint,
      required this.onChanged,
      this.textStyle,
      this.hintStyle,
      this.labelStyle,
      this.validator,
      this.error,
      this.isMandatory = true,
      this.onTap,
      this.background = kWhiteColor,
      this.icon,
      this.suffixIcon,
      required this.items})
      : super(key: key);

  final bool isMandatory;
  final String label;
  final String hint;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final void Function(String?) onChanged;
  final String? Function(String?)? validator;
  // final TextEditingController controller;
  final String? error;
  final Function()? onTap;
  final Color background;
  final Widget? icon;
  final Icon? suffixIcon;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isMandatory) ...[
          RichText(
            text: TextSpan(
              text: label,
              style: labelStyle ??
                  kRubik.copyWith(
                      color: kPrimaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
              children: [
                TextSpan(
                    text: '*',
                    style: kRubik.copyWith(
                        color: kErrorColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600))
              ],
            ),
          ),
        ] else ...[
          Text(
            label.tr,
            style: labelStyle ??
                kRubik.copyWith(
                    color: kPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
          )
        ],
        const SizedBox(height: kDefaultPadding / 5 * 2),
        DropdownButtonFormField<String>(
          items: [
            for (var item in items)
              DropdownMenuItem(
                value: item,
                child: Text(item,
                    style: textStyle ??
                        kRubik.copyWith(
                            color: kDarkPrimaryColor, fontSize: 14)),
              )
          ],
          onTap: onTap,
          validator: validator,
          onChanged: onChanged,
          style: textStyle ??
              kRubik.copyWith(color: kDarkPrimaryColor, fontSize: 13),
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: icon,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: 14),
            errorText: error != null && error!.isNotEmpty ? error : null,
            hintText: hint,
            fillColor: background,
            filled: true,
            suffixIcon: suffixIcon,
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: kErrorColor, width: 2),
            ),
            hintStyle: hintStyle ??
                kRubik.copyWith(
                    color: kDarkPrimaryColor.withOpacity(0.5), fontSize: 14),
            errorStyle: kRubik.copyWith(color: kErrorColor, fontSize: 12),
            errorMaxLines: 2,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: kErrorColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: kPrimaryColor, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(color: kDarkPrimaryColor.withOpacity(0.5))),
          ),
        ),
      ],
    );
  }
}
