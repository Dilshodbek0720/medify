import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class EmailImageCard extends StatelessWidget {
  const EmailImageCard({super.key, required this.images, required this.dateTime});
  final List<String> images;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(images.length, (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.primary100),
              borderRadius: BorderRadius.circular(4.r)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(4.r), topRight: Radius.circular(4.r)),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.height*0.15,
                    child: Image.file(
                      File(images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.primary100,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4.r), bottomRight: Radius.circular(4.r)),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: Padding(
                      padding: EdgeInsets.all(20.r),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 24.w,
                            width: 24.w,
                            child: SvgPicture.asset(AppIcons.image, colorFilter: const ColorFilter.mode(AppColors.red, BlendMode.srcIn)),
                          ),
                          20.pw,
                          Text(images[index].substring(images[index].length-23)),
                          const Spacer(),
                          GestureDetector(
                            onTap: (){ },
                            child: SizedBox(
                              height: 24.w,
                              width: 24.w,
                              child: SvgPicture.asset(AppIcons.cancel),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ))
      ],
    );
  }
}
