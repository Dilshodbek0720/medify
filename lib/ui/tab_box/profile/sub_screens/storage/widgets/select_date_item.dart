import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class SelectDateItem extends StatelessWidget {
  const SelectDateItem({super.key, required this.isSelected, required this.onTap, required this.dayName, required this.day});
  final bool isSelected;
  final VoidCallback onTap;
  final String dayName;
  final String day;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6.r),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.storageBlueColor : AppColors.white,
            borderRadius: BorderRadius.circular(6.r)
        ),
        child: Column(
          children: [
            Text(dayName, style: TextStyle(
              color: isSelected ? AppColors.white : AppColors.c_900,
              fontSize: 12.sp,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),),
            18.ph,
            Text(day, style: TextStyle(
              color: isSelected ? AppColors.white : AppColors.c_700,
              fontSize: 14.sp,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),),
          ],
        ),
      ),
    );
  }
}
