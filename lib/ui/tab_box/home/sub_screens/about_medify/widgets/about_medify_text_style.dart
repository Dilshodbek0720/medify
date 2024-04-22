import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';

class AboutMedifyTextStyle extends StatelessWidget {
  const AboutMedifyTextStyle({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: RichText(
        text: TextSpan(
          text: text1,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.c_900,
              fontSize: 26.sp),
          children: <TextSpan>[
            TextSpan(
              text: text2,
              style: const TextStyle(fontWeight: FontWeight.w500, color: AppColors.green),
            ),
          ],
        ),
      ),
    );
  }
}
