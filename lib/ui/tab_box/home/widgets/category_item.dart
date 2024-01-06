import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.icon, required this.title});
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6.r),
          decoration: const BoxDecoration(
              color: AppColors.blueTransparent,
              shape: BoxShape.circle
          ),
          child: getIcon(icon,iconType: IconType.bold, width: 24, context: context, onTap: (){ },color: AppColors.primary),
        ),
        12.ph,
        Text(title, style: TextStyle(
          color: AppColors.c_800,
          fontSize: 16.sp,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w700,
          letterSpacing: 0.20,
        ),),
      ],
    );
  }
}
