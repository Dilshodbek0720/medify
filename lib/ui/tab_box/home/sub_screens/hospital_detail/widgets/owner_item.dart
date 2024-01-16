import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class OwnerItem extends StatelessWidget {
  const OwnerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.r),
      child: Row(
        children: [
          SizedBox(
            height: 60.w,
            width: 60.w,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: GestureDetector(
                    onTap: (){

                    },
                    child: Image.asset(AppIcons.drWatson))),
          ),
          16.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Natasya Wilodra",
                style: TextStyle(
                  color: AppColors.c_900,
                  fontSize: 18.sp,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                ),
              ),
              4.ph,
              Text("Owner",
                style: TextStyle(
                    color: AppColors.c_700,
                    fontSize: 14.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2
                ),
              )
            ],
          ),
          const Spacer(),
          getIcon(AppIcons.chat, context: context, color: AppColors.primary500, onTap: (){

          }),
          getIcon(AppIcons.call, context: context, color: AppColors.primary500, onTap: (){

          })
        ],
      ),
    );
  }
}
