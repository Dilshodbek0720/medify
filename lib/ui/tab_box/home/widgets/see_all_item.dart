import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';

class SeeAllItem extends StatelessWidget {
  const SeeAllItem({super.key, required this.onTap, required this.title});
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: const BoxDecoration(color: AppColors.white),
      child: Row(
        children: [
          Text(
            title,
            style:
            Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: onTap,
            child: Text(
              'See All',
              style: TextStyle(
                fontFamily: "Urbanist",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary
              ),
            ),
          ),
        ],
      ),
    );
  }
}
