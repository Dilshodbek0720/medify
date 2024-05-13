import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';

class WorkHourItem extends StatelessWidget {
  const WorkHourItem({super.key, required this.dayName, required this.dayHour});
  final String dayName;
  final String dayHour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dayName,
            style: TextStyle(
                color: AppColors.c_800,
                fontSize: 14.sp,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2),
          ),
          Text(
            dayHour,
            style: TextStyle(
                color: AppColors.c_800,
                fontSize: 14.sp,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2),
          ),
        ],
      ),
    );
  }
}
