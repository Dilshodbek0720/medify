import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/enterence/onboarding/widgets/page_view_icon_index.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/fonts/text_styles.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.description,
    required this.img,
    required this.leftOnTap,
    required this.rightOnTap,
    required this.pageIndex,
  });

  final String title;
  final String img;
  final VoidCallback leftOnTap;
  final VoidCallback rightOnTap;
  final int pageIndex;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        16.ph,
        Padding(
          padding: EdgeInsets.all(16.r),
          child: Image.asset(
            img,
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.width*0.8,
            fit: BoxFit.cover,
          ),
        ),
        48.ph,
        Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(title,
            textAlign: TextAlign.center,
            style: AppTextStyle.h2Bold.copyWith(
              color: const Color(0xFF246BFD),
              fontSize: 34.sp,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        24.ph,
        Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(description,
            textAlign: TextAlign.center,
            style: AppTextStyle.h2Bold.copyWith(
              color: AppColors.c_600,
              fontSize: 16.sp,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pageIndex == 0 ? GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(width: 1, color: AppColors.white)
                  ),
                  child: getIcon(AppIcons.arrowLeft, context: context, onTap: (){ }, color: AppColors.white),
                ),
              ) : GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(width: 1, color: AppColors.primary)
                  ),
                  child: getIcon(AppIcons.arrowLeft, context: context, onTap: leftOnTap, color: AppColors.primary),
                ),
              ),
              const Spacer(),
              PageIndexItem(activePageIndex: pageIndex),
              const Spacer(),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(width: 1, color: AppColors.primary)
                  ),
                  child: getIcon(AppIcons.arrowRight, context: context, onTap: rightOnTap, color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
        48.ph,
      ],
    );
  }
}