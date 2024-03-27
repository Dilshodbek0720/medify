import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class StorageOpenFile extends StatelessWidget {
  const StorageOpenFile({super.key, required this.dateTime, required this.isFile, required this.folderName, required this.text, required this.image});
  final String dateTime;
  final String folderName;
  final String text;
  final bool isFile;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.primary100,
                border: Border.all(width: 1, color: AppColors.primary100),
                borderRadius: BorderRadius.circular(16.r)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 28.w,
                        width: 28.w,
                        child: isFile ? SvgPicture.asset(AppIcons.paper) : SvgPicture.asset(AppIcons.image, colorFilter: const ColorFilter.mode(AppColors.red, BlendMode.srcIn)),
                      ),
                      20.pw,
                      Text(folderName,style: TextStyle(
                          color: AppColors.c_900,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600
                      )),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.r),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.2,
                        width: MediaQuery.of(context).size.width*0.9,
                        child: Image.asset(image, fit: BoxFit.cover,)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(80.r),
                        child: SizedBox(
                            height: 36.r,
                            width: 36.r,
                            child: Image.asset(AppIcons.drWatson, fit: BoxFit.cover,)),
                      ),
                      20.pw,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(text, style: const TextStyle(
                              fontWeight: FontWeight.w500
                          ),),
                          Text(dateTime, style: const TextStyle(
                            fontWeight: FontWeight.w500
                          ),),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
