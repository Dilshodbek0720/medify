import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class BedCountItem extends StatelessWidget {
  const BedCountItem({super.key, required this.title, required this.icon});
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          height: 40.r,
          width: 40.r,decoration: BoxDecoration(
            color: AppColors.blueTransparent.withOpacity(0.2),
            borderRadius: BorderRadius.circular(100)
        ),
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: SvgPicture.asset(
              icon,
              width: 16.r,
              // colorFilter: const ColorFilter.mode(
              //     AppColors.primary, BlendMode.srcIn),
            ),
          ),
        ),
        8.pw,
        Text(title, style: TextStyle(
          color: AppColors.c_900,
          fontSize: 14.sp,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
          letterSpacing: 0.20,
        ),),
      ],
    );
  }
}
