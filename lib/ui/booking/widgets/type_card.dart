import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class TypeCard extends StatelessWidget {
  const TypeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(28.r)),
      child: Padding(
        padding: EdgeInsets.all(14.r),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  AppIcons.drWatson,
                  width: 120.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.h,right: 12.w),
                  child: DecoratedBox(decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: AppColors.cF0F0F0
                  ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.getSvg(name: AppIcons.star,iconType: IconType.bold),width: 10.w,colorFilter: const ColorFilter.mode(AppColors.orange, BlendMode.srcIn)),
                          4.pw,
                          Text("4.8",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary500,
                                  fontSize: 12.sp))
                        ],
                      ),
                    ),),
                )
              ],
            ),
            16.pw,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150.w,
                  child: Text("Modernica Apartment",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.c_900,
                          fontSize: 20.sp)),
                ),
                12.ph,
                Text("New York, US",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.c_700,
                        fontSize: 14.sp)),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    18.pw,
                    getIcon(AppIcons.heart, context: context, onTap: (){},width: 24,splashRadius: 24),
                  ],
                ),
                24.ph,
                SizedBox(
                  width: 54.w,
                  child: Text("\$29",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary500,
                          fontSize: 24.sp)),
                ),
                4.ph,
                SizedBox(
                  width: 54.w,
                  child: Text("/ night",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.c_700,
                          fontSize: 14.sp)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
