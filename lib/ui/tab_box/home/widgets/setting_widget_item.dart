import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class SettingWidgetItem extends StatelessWidget {
  const SettingWidgetItem({super.key, required this.title, required this.description, required this.icon, required this.onTap});
  final String title;
  final String description;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(width: 3, color: AppColors.c_600),
        ),
        child: Material(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24.r),
          child: InkWell(
            borderRadius: BorderRadius.circular(24.r),
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      DecoratedBox(
                          decoration: BoxDecoration(
                              color: AppColors.category8,
                              borderRadius: BorderRadius.circular(20.r)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6.r),
                            child: IconButton(
                              onPressed: (){

                              },
                              icon: SvgPicture.asset(icon),
                            ),
                          )),
                      SvgPicture.asset(AppIcons.iconBack,width: 45.w),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: "Urbanist",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.c_900,
                        ),
                      ),
                      8.ph,
                      Text(
                        description,
                        style: TextStyle(
                          fontFamily: "Urbanist",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.c_700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
