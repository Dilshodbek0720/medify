import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';

class MeetAppbar extends StatelessWidget implements PreferredSize{
  const MeetAppbar({super.key, required this.onTapOpen});
  final VoidCallback onTapOpen;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      toolbarHeight: 82.h,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: AppColors.white),
      title: Container(
        margin: EdgeInsets.only(top: 8.h, bottom: 2.h),
        decoration: BoxDecoration(
            color: const Color(0xFFDBE9F2),
            borderRadius: BorderRadius.circular(100.r),
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 6.h),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 14.w, top: 14.h, bottom: 14.h),
              child: InkWell(
                onTap: onTapOpen,
                child: SizedBox(
                  width: 26.w,
                  height: 26.w,
                  child: SvgPicture.asset(AppIcons.drawer),
                ),
              ),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 16.w, top: 10.h, bottom: 10.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: SizedBox(
                  height: 40.w,
                  width: 40.w,
                  child: Image.asset(AppIcons.drWatson),
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide:
                const BorderSide(width: 1, color: AppColors.c_200)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide:
                const BorderSide(width: 1, color: AppColors.c_200)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide:
                const BorderSide(width: 1, color: AppColors.c_200)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide:
                const BorderSide(width: 1, color: AppColors.c_200)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide:
                const BorderSide(width: 1, color: AppColors.c_200)),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity,82.h);
}
