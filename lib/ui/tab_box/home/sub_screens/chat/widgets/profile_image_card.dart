import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class ProfileImageCard extends StatelessWidget {
  const ProfileImageCard({super.key, required this.onTap, required this.icon});
  final VoidCallback onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 28.r),
          color: AppColors.primary400.withOpacity(0.8),
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
            bottom: 24.h,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: SizedBox(
                  width: 70.r,
                  height: 70.r,
                  child: Image.asset(AppIcons.profileChat, fit: BoxFit.cover),),),
              24.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dilshodbek Sayitqulov",
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white),
                  ),
                  5.ph,
                  Text(
                    "Yaqinda onlain edi",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: 24.w,
          bottom: 0,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(100.r),
            child: Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: AppColors.c_300)
              ),
              child: SizedBox(
                width: 30.r,
                height: 30.r,
                child: icon,
              ),),
          ),)
      ],
    );
  }
}
