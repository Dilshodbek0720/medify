import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/fonts/text_styles.dart';
import 'package:medify/utils/size/screen_size.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

// ignore: must_be_immutable
class ForgotPasswordSelector extends StatefulWidget {
  ForgotPasswordSelector({
    super.key,
    required this.svg,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.pressed,
  });

  final String svg;
  final bool pressed;
  final String title;
  final String subtitle;
  VoidCallback onTap;

  @override
  State<ForgotPasswordSelector> createState() => _ForgotPasswordSelectorState();
}

class _ForgotPasswordSelectorState extends State<ForgotPasswordSelector> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: height * 128 / figmaHeight,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(32.r),
          border: Border.all(
              color: widget.pressed
                  ? AppColors.disabledButton
                  : AppColors.c_200,
              width: 2.w),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: width * 0.02,
            left: width * 0.05,
            right: width * 0.05,
            bottom: width * 0.02,
          ),
          child: Row(
            children: [
              Container(
                  height: 80.w,
                  width: 80.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150.r),
                      color: AppColors.blueTransparent),
                  child: getIcon(widget.svg, context: context, onTap: () {})),
              20.pw,
              RichText(
                text: TextSpan(
                  text: widget.title,
                  style: AppTextStyle.bodyMediumMedium.copyWith(color: AppColors.c_600,letterSpacing: 0.2),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.subtitle,
                        style: AppTextStyle.bodyLargeBold.copyWith(color: AppColors.c_900,letterSpacing: 0.2)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}