import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        100.ph,
        SvgPicture.asset(AppIcons.notFound),
        40.ph,
        Text("Not Found",
          style: TextStyle(
            fontFamily: "Urbanist",
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.c_900,
          ),),
        12.ph,
        SizedBox(
          width: 380.w,
          child: Text("Sorry, the keyword you entered cannot be found, please check again or search with another keyword.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Urbanist",
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.c_900,
            ),),
        ),
      ],
    );
  }
}
