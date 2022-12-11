import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusat_pengaduan/common/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.label,
      required this.hint,
      this.onChanged,
      this.textStyle,
      this.hintStyle,
      this.labelStyle,
      this.validator,
      this.controller,
      this.keyboardType,
      this.textCapitalization,
      this.error,
      this.readOnly = false,
      this.enabled = true,
      this.isMandatory = true,
      this.textInputAction,
      this.onTap,
      this.background = kWhiteColor,
      this.maxLines = 1,
      this.icon,
      this.suffixIcon})
      : super(key: key);

  final bool isMandatory;
  final String label;
  final String hint;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final String? error;
  final bool readOnly, enabled;
  final Function()? onTap;
  final Color background;
  final int? maxLines;
  final Widget? icon;
  final Icon? suffixIcon;

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
        TextFormField(
          onTap: onTap,
          enabled: enabled,
          readOnly: readOnly,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          keyboardType: keyboardType ?? TextInputType.text,
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          style: textStyle ??
              kRubik.copyWith(color: kDarkPrimaryColor, fontSize: 14),
          textInputAction: textInputAction,
          maxLines: maxLines ?? 1,
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: icon,
            contentPadding: const EdgeInsets.all(kDefaultPadding),
            errorText: error != null && error!.isNotEmpty ? error : null,
            hintText: hint,
            fillColor: Colors.transparent,
            filled: true,
            suffixIcon: suffixIcon,
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: kErrorColor, width: 2),
            ),
            hintStyle: hintStyle ??
                kRubik.copyWith(color: kDarkPrimaryColor.withOpacity(0.5)),
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
