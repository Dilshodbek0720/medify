import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class StorageFilesCard extends StatelessWidget {
  const StorageFilesCard({super.key, required this.title, required this.description, required this.onTap});
  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Container(
        padding: EdgeInsets.all(18.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            color: AppColors.white
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: AppColors.c_900,
                      fontSize: 14.sp,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1
                  ),
                ),
                5.ph,
                Text(
                  description,
                  style: TextStyle(
                      color: AppColors.c_700,
                      fontSize: 12.sp,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1
                  ),
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(6.r),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 18.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: AppColors.storageBackgroundColor
                ),
                child: Text('SEE FILE', style: TextStyle(
                  color: AppColors.storageBlueColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Urbanist',
                  fontSize: 12.sp,
                  letterSpacing: 1,
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}