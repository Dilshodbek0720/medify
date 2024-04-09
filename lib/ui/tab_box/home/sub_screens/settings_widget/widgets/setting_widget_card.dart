import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class SettingWidgetCard extends StatelessWidget {
  const SettingWidgetCard({super.key, required this.title, required this.onTap, required this.isSelected});
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.c_100),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: isSelected ? SvgPicture.asset(AppIcons.cancel) : const Icon(
                Icons.add,
                color: AppColors.primary,
              ),
            ),
          ),
          16.pw,
          Text(
            title,
            style: TextStyle(
                fontSize: 20.sp, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          isSelected ? SizedBox(
            height: 24.w,
            width: 24.w,
            child: const Icon(Icons.drag_handle),
          ) : const SizedBox(),
        ],
      ),
    );
  }
}
