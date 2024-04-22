import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class ReklamaItem extends StatelessWidget {
  const ReklamaItem({super.key, required this.image, required this.onTap});
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          width: MediaQuery.of(context).size.width*0.9,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFFE1EEFE),
              borderRadius: BorderRadius.circular(24.r)
            ),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.9-180*MediaQuery.of(context).size.height/926,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.h, left: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Medify ',
                            style: TextStyle(
                              color: AppColors.primary400,
                              fontSize: 24.sp,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w700,
                            ),
                            children: const <TextSpan>[
                              TextSpan(
                                text: 'bu nima?',
                                style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.c_900),
                              ),
                            ],
                          ),
                        ),
                        12.ph,
                        Text("Nega bizni tanlash kerak?",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                              color: AppColors.c_900,
                              fontSize: 16.sp,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.2
                          ),
                        ),
                        12.ph,
                        Text("Bizning xizmatlarimiz?",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                              color: AppColors.c_900,
                              fontSize: 16.sp,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.2
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.all(6.r),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.blue,
                          ),
                          child: SizedBox(
                            width: 24.w,
                            height: 24.w,
                            child: SvgPicture.asset(AppIcons.arrowRight2, colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),),
                          ),
                        ),
                        24.ph,
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 180*MediaQuery.of(context).size.height/926,
                  height: 220*MediaQuery.of(context).size.height/926,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(24.r), bottomRight: Radius.circular(24.r),),
                      child: Image.asset(image, fit: BoxFit.cover,)),
                )
              ],),
          ),
      ),
    );
  }
}
