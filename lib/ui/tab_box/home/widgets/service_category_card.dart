import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class ServiceCategoryCard extends StatelessWidget {
  const ServiceCategoryCard({super.key, required this.onTap, required this.title, required this.icon});
  final VoidCallback onTap;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width*0.27,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(width: 1, color: AppColors.c_300),
      ),
      child: Material(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              children: [
                SizedBox(
                  width: width*0.15,
                  height: width*0.15,
                  child: Image.asset(icon, fit: BoxFit.fill,),
                ),
                6.ph,
                Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
