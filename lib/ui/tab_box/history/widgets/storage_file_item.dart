import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class StorageFileItem extends StatelessWidget {
  const StorageFileItem({super.key, required this.folderName, required this.description, required this.isFile});
  final String folderName;
  final String description;
  final bool isFile;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 28.w,
              width: 28.w,
              child: isFile ? SvgPicture.asset(AppIcons.paper) : SvgPicture.asset(AppIcons.image, colorFilter: const ColorFilter.mode(AppColors.red, BlendMode.srcIn)),
            ),
            20.pw,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(folderName,style: TextStyle(
                    color: AppColors.c_900,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600
                )),
                6.ph,
                Text(description, style: TextStyle(
                  color: AppColors.c_700,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500
                ),),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: (){ },
              child: SizedBox(
                height: 24.w,
                width: 24.w,
                child: const Icon(Icons.more_vert, color: AppColors.c_900,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}