import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class DoctorDetailWidget extends StatelessWidget {
  const DoctorDetailWidget({super.key, required this.icon, required this.title,required this.description, required this.onTap, required this.onTapWidget});
  final String icon;
  final String title;
  final String description;
  final VoidCallback onTap;
  final VoidCallback onTapWidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapWidget,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: const BoxDecoration(
                color: AppColors.blueTransparent,
                shape: BoxShape.circle
            ),
            child: getIcon(icon,iconType: IconType.bold, width: 24, context: context, onTap: onTap,color: AppColors.primary),
          ),
          8.ph,
          Text(title, style: TextStyle(
            color: AppColors.primary500,
            fontSize: 16.sp,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
            letterSpacing: 0.20,
          ),),
          8.ph,
          Text(
            description,  style: TextStyle(
            color: AppColors.c_800,
            fontSize: 12.sp,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w500,
            letterSpacing: 0.20,
          ),
          ),
        ],
      ),
    );
  }
}
