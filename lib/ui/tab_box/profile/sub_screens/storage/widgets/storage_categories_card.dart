import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class StorageCategoriesCard extends StatelessWidget {
  const StorageCategoriesCard({super.key, required this.icon, required this.title, required this.description});
  final String icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r)
      ),
      child: Row(
        children: [
          SizedBox(
            width: 50.r,
            height: 50.r,
            child: SvgPicture.asset(icon),
          ),
          14.pw,
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
          )
        ],
      ),
    );
  }
}
