import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class PaymentTextField extends StatelessWidget {
  const PaymentTextField(
      {super.key,
        required this.text,
        required this.hintText,
        required this.onChanged,
        this.maskFormatter,
        required this.textInputType,
        required this.textInputAction});

  final String text;
  final String hintText;
  final ValueChanged onChanged;
  final MaskTextInputFormatter? maskFormatter;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: AppColors.dark2,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  fontFamily: "Urbanist"
              ),
            ),
          ],
        ),
        12.ph,
        TextField(
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          inputFormatters: [maskFormatter!],
          keyboardType: textInputType,
          textInputAction: textInputAction,
          onChanged: onChanged,
          style: TextStyle(
              color: AppColors.dark2,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              fontFamily: "Urbanist"
          ),
          decoration: InputDecoration(
              hintText: hintText,
              fillColor: AppColors.c_50,
              filled: true,
              hintStyle: TextStyle(
                  color: AppColors.dark2,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  fontFamily: "Urbanist"
              ),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                      width: 1.w, color: AppColors.white)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                      width: 1.w, color: AppColors.white)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                      width: 1.w, color: AppColors.white)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                      width: 1.w, color: AppColors.white)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                      width: 1.w, color: AppColors.white))),
        ),
      ],
    );
  }
}