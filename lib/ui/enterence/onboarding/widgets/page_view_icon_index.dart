import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';

class PageIndexItem extends StatelessWidget {
  const PageIndexItem({
    super.key,
    required this.activePageIndex,
  });

  final int activePageIndex;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 12.w,
          width: 12.w,
          decoration: BoxDecoration(
            color: activePageIndex == 0 ? AppColors.primary : AppColors.c_300,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        SizedBox(width: width / 80),
        Container(
          height: 12.w,
          width: 12.w,
          decoration: BoxDecoration(
            color: activePageIndex == 1 ? AppColors.primary : AppColors.c_300,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        SizedBox(width: width / 80),
        Container(
          height: 12.w,
          width: 12.w,
          decoration: BoxDecoration(
            color: activePageIndex == 2 ? AppColors.primary : AppColors.c_300,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        SizedBox(width: width / 80),
        Container(
          height: 12.w,
          width: 12.w,
          decoration: BoxDecoration(
            color: activePageIndex == 3 ? AppColors.primary : AppColors.c_300,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ],
    );
  }
}