import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class UsersItem extends StatelessWidget {
  const UsersItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.r),
      child: Row(
        children: [
          SizedBox(
            height: 48.w,
            width: 48.w,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: GestureDetector(
                    onTap: () {

                    },
                    child: Image.asset(AppIcons.drWatson))),
          ),
          16.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Morning",
                style: TextStyle(
                    color: AppColors.c_600,
                    fontSize: 16.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2),
              ),
              6.ph,
              Text(
                "Andrew Ainsley",
                style: TextStyle(
                  color: AppColors.c_900,
                  fontSize: 20.sp,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          const Spacer(),
          getIcon(AppIcons.notification, context: context, onTap: () {
            Navigator.pushNamed(
                context, RouteNames.notificationScreen);
          }),
        ],
      ),
    );
  }
}
