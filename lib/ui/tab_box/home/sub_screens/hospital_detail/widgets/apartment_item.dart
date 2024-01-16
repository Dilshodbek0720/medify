import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class ApartmentItem extends StatelessWidget {
  const ApartmentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(6.r),
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: 6.h, horizontal: 10.w),
              decoration: BoxDecoration(
                  color: AppColors.blueTransparent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6.r)),
              child: Text(
                "Apartment",
                style: TextStyle(
                  color: AppColors.primary500,
                  fontSize: 12.sp,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.20,
                ),
              ),
            ),
          ),
          10.pw,
          SvgPicture.asset(
            AppIcons.getSvg(
              name: AppIcons.star,
              iconType: IconType.bold,
            ),
            colorFilter: const ColorFilter.mode(
                AppColors.yellow, BlendMode.srcIn),
          ),
          6.pw,
          Text('4.8 (1,275 reviews)', style: TextStyle(
            color: AppColors.c_800,
            fontSize: 16.sp,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.20,
          ),)
        ],
      ),
    );
  }
}
