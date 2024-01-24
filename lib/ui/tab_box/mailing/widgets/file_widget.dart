import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class FileWidget extends StatelessWidget {
  const FileWidget({super.key, required this.onTap, required this.fileName, required this.fileFormat, required this.fileIcon});
  final VoidCallback onTap;
  final String fileName;
  final String fileFormat;
  final String fileIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 14.h),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(fileName, style: TextStyle(
                fontFamily: "Urbanist",
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: AppColors.c_900
            ),),
            11.ph,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20.r,
                  width: 20.r,
                  child: SvgPicture.asset(fileIcon),
                ),
                10.pw,
                Text(fileFormat, style: TextStyle(
                    fontFamily: "Urbanist",
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.c_500
                ),),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
