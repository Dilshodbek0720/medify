import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';

class PageImagesIndex extends StatelessWidget {
  const PageImagesIndex({
    super.key,
    required this.activePageIndex,
  });

  final int activePageIndex;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...List.generate(3, (index) => Container(
            height: 8.w,
            width: activePageIndex == index ? 32.w : 8.w,
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            decoration: BoxDecoration(
              color: activePageIndex == index ? AppColors.primary : AppColors.c_300,
              borderRadius: BorderRadius.circular(100),
            ),
          ),)
        ],
      ),
    );
  }
}