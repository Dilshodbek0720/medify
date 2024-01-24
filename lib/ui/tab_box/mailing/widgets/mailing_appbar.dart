import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';

class MailingAppbar extends StatelessWidget implements PreferredSize{
  const MailingAppbar({super.key, required this.onTapOpen});
  final VoidCallback onTapOpen;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      toolbarHeight: 82.h,
      systemOverlayStyle:
      const SystemUiOverlayStyle(statusBarColor: AppColors.white),
      title: Container(
        margin: EdgeInsets.only(top: 8.h, bottom: 2.h),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.06),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
              BoxShadow(
                color: AppColors.black.withOpacity(0.1),
                blurRadius: 3,
                offset: const Offset(0, 1),
              )
            ]),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding:
              EdgeInsets.only(left: 14.w, top: 14.h, bottom: 14.h),
              child: InkWell(
                onTap: onTapOpen,
                child: SizedBox(
                  width: 24.w,
                  height: 24.w,
                  child: SvgPicture.asset(AppIcons.drawer),
                ),
              ),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 16.w, top: 10.h, bottom: 10.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: SizedBox(
                  height: 44.w,
                  width: 44.w,
                  child: Image.asset(AppIcons.drWatson),
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide:
                const BorderSide(width: 1, color: AppColors.c_200)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide:
                const BorderSide(width: 1, color: AppColors.c_200)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide:
                const BorderSide(width: 1, color: AppColors.c_200)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide:
                const BorderSide(width: 1, color: AppColors.c_200)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide:
                const BorderSide(width: 1, color: AppColors.c_200)),
          ),
        ),
      ),
      bottom: TabBar(
        isScrollable: true,
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.c_500,
        tabAlignment: TabAlignment.center,
        labelPadding: EdgeInsets.symmetric(horizontal: 45.w),
        indicatorColor: AppColors.primary,
        labelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Urbanist'
        ),
        tabs: const <Widget>[
          Tab(text: "All",),
          Tab(text: "Unread"),
          Tab(text: "Read"),
        ],
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity,142.h);
}
