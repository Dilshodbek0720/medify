import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';

class ChekItem extends StatelessWidget {
  const ChekItem({super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Text(title, style: TextStyle(
              color: AppColors.c_900,
              fontSize: 16.sp
          ),
          ),
          const Spacer(),
          Text(description, style: TextStyle(
              color: AppColors.c_900,
              fontSize: 16.sp
          ),)
        ],
      ),
    );
  }
}
