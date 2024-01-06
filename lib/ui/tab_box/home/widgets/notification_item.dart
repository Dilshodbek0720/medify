import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key,required this.icon, required this.transparentColor, required this.title, required this.description, required this.color, required this.date});
  final String icon;
  final Color transparentColor;
  final Color color;
  final String title;
  final String date;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(6.r),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: transparentColor
                ),
                child: getIcon(icon,color: color, context: context, onTap: (){ }),
              ),
              16.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: TextStyle(
                    color: AppColors.c_900,
                    fontSize: 20.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,),),
                  6.ph,
                  Text(date, style: TextStyle(
                    color: AppColors.c_700,
                    fontSize: 14.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.20,
                  ),)
                ],
              )
            ],
          ),
          20.ph,
          Text(description,
            style: TextStyle(
              color: AppColors.c_800,
              fontSize: 14.sp,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.20,
            ),
          )
        ],
      ),
    );
  }
}
