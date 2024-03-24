import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class CategoryItem2 extends StatelessWidget {
  const CategoryItem2({super.key, required this.icon, required this.title, required this.onTap, required this.background});
  final String icon;
  final String title;
  final VoidCallback onTap;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(100.r),
          onTap: onTap,
          child: Stack(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(100.r)
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: IconButton(
                    onPressed: onTap,
                    icon: SvgPicture.asset(icon),
                  ),
                )),
              SvgPicture.asset(AppIcons.iconBack,width: 40.w),
            ],
          ),
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
