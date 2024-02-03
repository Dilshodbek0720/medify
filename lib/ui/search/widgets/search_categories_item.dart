import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class SearchCategoriesItem extends StatelessWidget {
  const SearchCategoriesItem({super.key, required this.onTap, required this.index, required this.selectType, required this.categoryName});
  final VoidCallback onTap;
  final int selectType;
  final int index;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: 6.w),
      child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Ink(
              padding: EdgeInsets.symmetric(
                  horizontal: 20.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(100.r),
                color: selectType == index
                    ? AppColors.primary500
                    : Colors.white,
                border: Border.all(
                    color: AppColors.primary),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.getSvg(name: AppIcons.star,iconType: IconType.bold),
                      width: 16.w,
                      colorFilter: ColorFilter.mode(
                          selectType==index?Colors.white:AppColors.primary500, BlendMode.srcIn)
                  ),
                  8.pw,
                  Text(
                    categoryName,
                    style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: selectType==index?Colors.white:AppColors.primary500,
                    ),
                  ),
                ],
              ))),
    );
  }
}
