import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';

class ReviewSlider extends StatelessWidget {
  const ReviewSlider({super.key, required this.percentage});
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      height: 4.h,
      width: MediaQuery.of(context).size.width*0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: AppColors.c_300,
      ),
      child: Row(
        children: [
          Container(
            height: 4.h,
            width: percentage*MediaQuery.of(context).size.width*0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: AppColors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
