import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/onboarding/widgets/page_view_icon_index.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/fonts/text_styles.dart';
import 'package:medify/utils/size/size_extension.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.img,
    required this.onTap,
    required this.pageIndex,
  });

  final String title;
  final String img;
  final VoidCallback onTap;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 18.h),
          child: Image.asset(
            img,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(60.r), topLeft: Radius.circular(60.r))
              ),
              child: Column(
                children: [
                  48.ph,
                  Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(title,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.h2Bold.copyWith(
                        color: Color(0xFF246BFD),
                        fontSize: 36.sp,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  48.ph,
                  PageIndexItem(activePageIndex: pageIndex),
                  24.ph,
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 24.h,
                    ),
                    child: GlobalButton(
                      title:  pageIndex == 3 ? "Get Started" : "Next",
                      radius: 100.r,
                      textColor: AppColors.white,
                      onTap: onTap, color: AppColors.primary,),
                  ),
                  24.ph,
                ],),
            ))
      ],
    );
  }
}