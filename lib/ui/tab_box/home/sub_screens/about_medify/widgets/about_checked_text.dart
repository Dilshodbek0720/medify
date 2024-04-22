import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class AboutCheckedText extends StatelessWidget {
  const AboutCheckedText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 3.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.r,
              width: 24.r,
              child: const Icon(Icons.check_box_outlined, color: AppColors.green,),
            ),
            12.pw,
            Flexible(
              child: Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.c_900,
                    fontSize: 16.sp),
              ),
            ),
          ],
        )
    );
  }
}
