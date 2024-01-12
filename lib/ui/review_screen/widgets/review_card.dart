import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({super.key, required this.index});

  final int index;

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                SizedBox(
                  height:48.h,
                  child: DecoratedBox(decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100)
                  ),
                      child: Image.asset(AppIcons.userCircle,fit: BoxFit.cover,)),
                ),
                16.pw,
                SizedBox(
                  width: 180.w,
                  child: Text("Charolette Hanlin",
                    style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.c_900,
                    ),),
                ),
                const Spacer(),
                SizedBox(
                  width: 64.5.w,
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(100.r),
                        color: Colors.white,
                        border: Border.all(
                            width: 2.w,
                            color: AppColors.primary),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.getSvg(name: AppIcons.star,iconType: IconType.bold),
                              width: 12.w,
                              colorFilter: const ColorFilter.mode(AppColors.primary500, BlendMode.srcIn)
                          ),
                          8.pw,
                          Text(
                            "${widget.index + 1}",
                            style: TextStyle(
                              fontFamily: "Urbanist",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary500,
                            ),
                          ),
                        ],
                      )),
                ),
                11.pw,
                getIcon(AppIcons.moreCircle, context: context, onTap: (){})
              ],
            ),
          ),
          12.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text("Dr. Jenny is very professional in her work and responsive. I have consulted and my problem is solved. 😍😍",
                style: TextStyle(
                  fontFamily: "Urbanist",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.c_900,
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                getIcon(AppIcons.heart, context: context, onTap: (){},width: 24,splashRadius: 24),
                Text("938",
                    style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.c_900,
                    )),
                24.pw,
                Text("6 days ago",
                    style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.c_700,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
