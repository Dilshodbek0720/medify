import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class AboutBenefitText extends StatelessWidget {
  const AboutBenefitText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 3.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(4.r),
              height: 16.r,
              width: 16.r,
              decoration: const BoxDecoration(
                color: AppColors.green,
                shape: BoxShape.circle,
              ),
            ),
            12.pw,
            Flexible(
              child: Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.c_900,
                    fontSize: 16.sp),
              ),
            ),
          ],
        )
    );
  }
}
