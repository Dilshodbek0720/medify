import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/fonts/text_styles.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton(
      {super.key, required this.text, required this.icon, required this.onTap,this.language="", this.isLanguage=false,this.isLogOut=false,this.borderRadius});

  final String text;
  final String icon;
  final VoidCallback onTap;
  final String language;
  final bool isLanguage;
  final bool isLogOut;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(color: AppColors.c_200),
          color: Colors.white
        ),
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
            child: Row(
              children: [
              isLogOut?SvgPicture.asset(
                AppIcons.getSvg(name: icon, iconType: IconType.curved),colorFilter: const ColorFilter.mode(AppColors.error, BlendMode.srcIn),):  SvgPicture.asset(
                    AppIcons.getSvg(name: icon, iconType: IconType.curved),colorFilter:  const ColorFilter.mode(AppColors.c_900, BlendMode.srcIn),),
                16.pw,
                Text(
                  text,
                  style:isLogOut?AppTextStyle.bodyXlargeSemibold.copyWith(color: AppColors.error):AppTextStyle.bodyXlargeSemibold,
                ),
                const Spacer(),
              isLanguage?Text(language,style: AppTextStyle.bodyXlargeSemibold,):const SizedBox(),
                16.pw,
              isLogOut?const SizedBox(): SvgPicture.asset(
                  AppIcons.getSvg(
                    name: AppIcons.arrowRight2,
                  ),
                colorFilter:  const ColorFilter.mode(AppColors.c_900, BlendMode.srcIn),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
