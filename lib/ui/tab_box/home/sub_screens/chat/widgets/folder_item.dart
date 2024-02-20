import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class FolderItem extends StatelessWidget {
  const FolderItem({super.key, required this.onTap, required this.icon, required this.title, required this.description, required this.radius});
  final VoidCallback onTap;
  final String icon;
  final String title;
  final String description;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                      color: AppColors.c_200
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.r),
                    child: SizedBox(
                      height: 24.w,
                      width: 24.w,
                      child: SvgPicture.asset(icon, colorFilter: const ColorFilter.mode(AppColors.c_900, BlendMode.srcIn),),
                    ),
                  ),
                ),
              ),
              12.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.c_900,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Urbanist'
                  ),),
                  Text(description, style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.c_600,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Urbanist'
                  ),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
