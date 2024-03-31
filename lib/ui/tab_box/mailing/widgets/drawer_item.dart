import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.isSelected, required this.title, required this.icon, required this.isCancel, required this.onTap});
  final bool isSelected;
  final String title;
  final String icon;
  final bool isCancel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: (isSelected && isCancel) ? AppColors.white : isSelected ? const Color(0xFFE3F2FD) : AppColors.white
          ),
          child: Row(
            children: [
              SizedBox(
                  width: 24.w,
                  height: 24.w,
                  child: SvgPicture.asset(icon, colorFilter: ColorFilter.mode((isSelected && isCancel) ? const Color(0xFFF44336) : isSelected ? const Color(0xFF1E88E5) : AppColors.c_800, BlendMode.srcIn),)),
              12.pw,
              Text(title,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "SF Pro Text",
                    color: (isSelected && isCancel) ? const Color(0xFFF44336) : isSelected ? const Color(0xFF1E88E5) : AppColors.c_800),
              )
            ],
          ),
        ),
      ),
    );
  }
}