import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.onTap, required this.title, required this.icon});
  final VoidCallback onTap;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 14.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.white,
            boxShadow: const [BoxShadow(
              color: AppColors.c_100,
              blurRadius: 1,
              spreadRadius: 1,
            )
            ]
        ),
        child: Row(
          children: [
            SizedBox(
              height: 16.r,
              width: 16.r,
              child: SvgPicture.asset(icon),
            ),
            16.pw,
            Text(title, style: TextStyle(
                fontFamily: "Urbanist",
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: AppColors.c_900
            ),),
          ],
        ),
      ),
    );
  }
}
