import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class RecentFilesCard extends StatelessWidget {
  const RecentFilesCard({super.key, required this.icon, required this.title, required this.description, required this.date, required this.onTap});
  final String icon;
  final String title;
  final String description;
  final String date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14.r),
        child: Container(
          padding: EdgeInsets.all(18.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: AppColors.white
          ),
          child: Row(
            children: [
              SizedBox(
                width: 45.r,
                height: 45.r,
                child: SvgPicture.asset(icon),
              ),
              12.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: AppColors.c_900,
                        fontSize: 14.sp,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1
                    ),
                  ),
                  5.ph,
                  Text(
                    description,
                    style: TextStyle(
                        color: AppColors.c_700,
                        fontSize: 12.sp,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                date,
                style: TextStyle(
                    color: AppColors.c_700,
                    fontSize: 12.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
