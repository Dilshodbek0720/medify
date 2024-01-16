import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class TypeCard extends StatelessWidget {
  const TypeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(28.r)),
      child: Padding(
        padding: EdgeInsets.all(14.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  AppIcons.laGrand,
                  width: 154.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.h, right: 12.w),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: AppColors.C_F0F0F0),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                              AppIcons.getSvg(
                                  name: AppIcons.star, iconType: IconType.bold),
                              width: 10.w,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.orange, BlendMode.srcIn)),
                          4.pw,
                          Text("4.8",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary500,
                                  fontSize: 12.sp))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            12.ph,
            Text(
              "La Grand Maison",
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.c_900),
            ),
            10.ph,
            Text(
              "Tokyo, Japan",
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.c_700),
            ),
            10.ph,
            Row(
              children: [
                Text(
                  "\$36",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary500),
                ),
                4.pw,
                Text(
                  "/ night",
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.c_700),
                ),
                60.pw,
                SvgPicture.asset(AppIcons.heart)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
