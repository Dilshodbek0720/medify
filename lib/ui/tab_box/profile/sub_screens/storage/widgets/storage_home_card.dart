import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class StorageHomeCard extends StatelessWidget {
  const StorageHomeCard({super.key, required this.activityOnTap});
  final VoidCallback activityOnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.storageBlueColor
      ),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {

                },
                borderRadius: BorderRadius.circular(8.r),
                child: SizedBox(
                  height: 41.w,
                  width: 41.w,
                  child: SvgPicture.asset(AppIcons.storageFile),
                ),
              ),
              12.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('2300 GB of 3000 GB', style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),),
                  Text('Available Storage', style: TextStyle(
                    color: AppColors.white,
                    fontSize: 12.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),),
                ],
              ),
            ],
          ),
          26.ph,
          Slider(value: 0.53,
              activeColor: AppColors.activeSliderColor,
              inactiveColor: AppColors.white,
              thumbColor: AppColors.white,
              onChanged: (v){ }
          ),
          26.ph,
          Row(
            children: [
              GestureDetector(
                onTap: activityOnTap,
                child: Text('View Activity', style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14.sp,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),),
              ),
              const Spacer(),
              GestureDetector(
                  onTap: (){},
                  child: SvgPicture.asset(AppIcons.arrowRight, colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),))
            ],
          ),
        ],
      ),
    );
  }
}
