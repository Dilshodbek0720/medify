import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({super.key, required this.title, required this.icon});
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            16.ph,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.r,
                  width: 24.r,
                  child: icon,
                ),
                12.pw,
                Flexible(
                  child: Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        fontSize: 16.sp),
                  ),
                ),
              ],
            ),
            16.ph,
            Divider(height: 1, color: AppColors.white.withOpacity(0.5),)
          ],
        )
    );
  }
}
