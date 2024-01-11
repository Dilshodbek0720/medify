import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector(
      {super.key,
      required this.onTap,
      required this.isSelected,
      required this.title});

  final VoidCallback onTap;
  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 4.h,
      ),
      onTap: onTap,
      title: Text(title,
        style: TextStyle(
            color: AppColors.c_900,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600),),
      trailing: isSelected
          ? SvgPicture.asset(AppIcons.selected)
          : SvgPicture.asset(AppIcons.unSelected),
    );
  }
}
