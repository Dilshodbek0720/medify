import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

void successDialog(
    {required BuildContext context,
      required String title,
      String text = "",
      required String image}) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
        content: Container(
          padding: EdgeInsets.only(top: 40.h, left: 32.w, right: 32.w, bottom: 32.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: Theme.of(context).scaffoldBackgroundColor),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                image,
                width: 180.w,
                height: 180.h,
              ),
              32.ph,
              Text(
                title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.primary,
                  fontFamily: "Urbanist",
                  fontSize: 24.sp,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 3,
              ),
              16.ph,
              Text(
                text,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.c_900,
                  fontFamily: "Urbanist",
                  fontSize: 16.sp,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.2,
                ),
                maxLines: 3,
              ),
              22.ph,
              SizedBox(height: 90.w, width: 90.w, child: Lottie.asset(AppIcons.loader),),
            ],
          ),
        ),
        contentPadding: EdgeInsets.zero,
      );
    },
  );
}