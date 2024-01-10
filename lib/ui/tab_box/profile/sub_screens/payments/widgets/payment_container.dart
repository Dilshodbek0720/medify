import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class PaymentContainer extends StatelessWidget {
  const PaymentContainer({super.key, required this.icon, required this.title, required this.state});

  final String icon;
  final String title;
  final String state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.white,
            boxShadow: const [
              BoxShadow(
                // Horizontal and vertical offset
                blurRadius: 60, // Blur radius
                color: Color.fromRGBO(4, 6, 15, 0.05), // Color with opacity
              ),
            ]),
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Row(children: [
            SvgPicture.asset(icon),
            12.pw,
            Text(
              title,
              style: TextStyle(
                color: AppColors.c_900,
                fontSize: 18.sp,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Text(state,
                style: TextStyle(
                  color: AppColors.primary500,
                  fontSize: 16.sp,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.20,
                )),
          ]),
        ),
      ),
    );
  }
}