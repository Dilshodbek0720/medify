import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class PaymentContainer extends StatelessWidget {
  const PaymentContainer({super.key, required this.icon, required this.title, required this.state, this.onTap, this.isSelect});

  final String icon;
  final String title;
  final String state;
  final bool? isSelect;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: DecoratedBox(
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
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          child: InkWell(
            borderRadius: BorderRadius.circular(16.r),
            onTap: onTap,
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
                onTap!=null?isSelect!
                    ? SvgPicture.asset(AppIcons.selected)
                    : SvgPicture.asset(AppIcons.unSelected)
                    :Text(state,
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
        ),
      ),
    );
  }
}