import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/tab_box/home/sub_screens/doctor_detail/widgets/review_slider.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class DoctorReviewRating extends StatelessWidget {
  const DoctorReviewRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                '4,0',
                style: TextStyle(
                  color: AppColors.c_900,
                  fontSize: 34.sp,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                ),
              ),
              4.ph,
              Row(
                children: [
                  SizedBox(
                    width: 14.w,
                    height: 14.w,
                    child: SvgPicture.asset(
                      AppIcons.getSvg(
                        name: AppIcons.star,
                        iconType: IconType.bold,
                      ),
                      colorFilter: const ColorFilter.mode(
                          AppColors.orange, BlendMode.srcIn),
                    ),
                  ),
                  4.pw,
                  SizedBox(
                    width: 14.w,
                    height: 14.w,
                    child: SvgPicture.asset(
                      AppIcons.getSvg(
                        name: AppIcons.star,
                        iconType: IconType.bold,
                      ),
                      colorFilter: const ColorFilter.mode(
                          AppColors.orange, BlendMode.srcIn),
                    ),
                  ),
                  4.pw,
                  SizedBox(
                    width: 14.w,
                    height: 14.w,
                    child: SvgPicture.asset(
                      AppIcons.getSvg(
                        name: AppIcons.star,
                        iconType: IconType.bold,
                      ),
                      colorFilter: const ColorFilter.mode(
                          AppColors.orange, BlendMode.srcIn),
                    ),
                  ),
                  4.pw,
                  SizedBox(
                    width: 14.w,
                    height: 14.w,
                    child: SvgPicture.asset(
                      AppIcons.getSvg(
                        name: AppIcons.star,
                        iconType: IconType.bold,
                      ),
                      colorFilter: const ColorFilter.mode(
                          AppColors.orange, BlendMode.srcIn),
                    ),
                  ),
                  4.pw,
                  SizedBox(
                    width: 14.w,
                    height: 14.w,
                    child: SvgPicture.asset(
                      AppIcons.getSvg(
                        name: AppIcons.star,
                        iconType: IconType.bold,
                      ),
                      colorFilter: const ColorFilter.mode(
                          AppColors.c_200, BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
              6.ph,
              Text(
                '(177)',
                style: TextStyle(
                  color: AppColors.c_700,
                  fontSize: 14.sp,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          12.pw,
          Column(
            children: [
              const ReviewSlider(percentage: 1),
              const ReviewSlider(percentage: 0.4),
              const ReviewSlider(percentage: 0.15),
              const ReviewSlider(percentage: 0.1),
              const ReviewSlider(percentage: 0.3),
            ],
          )
        ],
      ),
    );
  }
}
