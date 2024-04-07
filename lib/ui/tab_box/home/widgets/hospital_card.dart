import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class HospitalCard extends StatefulWidget {
  const HospitalCard({super.key});

  @override
  State<HospitalCard> createState() => _HospitalCardState();
}

class _HospitalCardState extends State<HospitalCard> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: AppColors.white,
          // borderRadius: BorderRadius.circular(24.r)
        ),
      child: Material(
        color: AppColors.white,
        // borderRadius: BorderRadius.circular(24.r),
        child: InkWell(
          // borderRadius: BorderRadius.circular(24.r),
          onTap: (){
            Navigator.pushNamed(context, RouteNames.hospitalDetailScreen);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppIcons.hospital,
                height: 150,
                width: 400,
                fit: BoxFit.cover,
              ),
              10.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  "Serenity Wellness Clinic",
                  style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.c_900),
                ),
              ),
              3.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  "Dental, Skin care",
                  style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.c_700),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: const Divider(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.getSvg(
                          name: AppIcons.location,
                          iconType: IconType.bold),
                      width: 12.w,
                      colorFilter: const ColorFilter.mode(
                          AppColors.primary, BlendMode.srcIn),
                    ),
                    5.pw,
                    Text(
                      "Grand City St. 100, New York, United States",
                      style: TextStyle(
                          fontFamily: "Urbanist",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.c_700),
                    ),
                  ],
                ),
              ),
              3.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.getSvg(
                          name: AppIcons.timeCircle,
                          iconType: IconType.bold),
                      width: 12.w,
                      colorFilter: const ColorFilter.mode(
                          AppColors.primary, BlendMode.srcIn),
                    ),
                    5.pw,
                    Text(
                      "15 min · 1,5 km",
                      style: TextStyle(
                          fontFamily: "Urbanist",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.c_700),
                    ),
                  ],
                ),
              ),
              15.ph,
            ],
          ),
        ),
      ),
    );
  }
}
