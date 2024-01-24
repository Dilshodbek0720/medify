import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class MailingCard extends StatelessWidget {
  const MailingCard({super.key, required this.image, required this.title, required this.jobName, required this.description, required this.onTapStar, required this.onTap});
  final String image;
  final String title;
  final String jobName;
  final String description;
  final VoidCallback onTapStar;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: SizedBox(
                  height: 40.w,
                  width: 40.w,
                  child: Image.asset(image),
                ),
              ),
              12.pw,
              SizedBox(
                width: MediaQuery.of(context).size.width*210/375,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: TextStyle(
                        fontFamily: "Urbanist",
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: AppColors.c_500
                    ),),
                    4.ph,
                    Text(jobName, style: TextStyle(
                        fontFamily: "Urbanist",
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: AppColors.c_900
                    ),),
                    8.ph,
                    Text(description, style: TextStyle(
                        fontFamily: "Urbanist",
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.c_500
                    ),),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('08:32', style: TextStyle(
                      fontFamily: "Urbanist",
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: AppColors.c_500
                  ),),
                  40.ph,
                  GestureDetector(
                    onTap: onTapStar,
                    child: SizedBox(
                      height: 20.w,
                      width: 20.w,
                      child: SvgPicture.asset(AppIcons.star),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}