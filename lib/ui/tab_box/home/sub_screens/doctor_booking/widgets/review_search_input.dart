import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';

class ReviewSearchInput extends StatefulWidget {
  final String hintText;
  final Widget? prefixIcon;
  final ValueChanged? onChanged;

  const ReviewSearchInput({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.onChanged,
  });

  @override
  State<ReviewSearchInput> createState() => _ReviewSearchInputState();
}

class _ReviewSearchInputState extends State<ReviewSearchInput> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          fontFamily: "Urbanist",
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.c_900,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 6.h),
        hintStyle: TextStyle(
          fontFamily: "Urbanist",
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.c_500,
        ),
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.c_400),
          borderRadius: BorderRadius.circular(14.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary500),
          borderRadius: BorderRadius.circular(14.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.c_400),
          borderRadius: BorderRadius.circular(14.r),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.c_400),
          borderRadius: BorderRadius.circular(14.r),
        ),
        prefix: widget.prefixIcon,
        fillColor: AppColors.white,
        filled: true,
      ),
      // style: TextStyle(color: AppColors.dark3, fontSize: 16.sp),
    );
  }
}
