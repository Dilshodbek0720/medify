import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorsCard extends StatefulWidget {
  const DoctorsCard(
      {super.key,
      required this.index,
      required this.name,
      required this.category,
      required this.experience,
      required this.language,
      required this.rating,
      this.length = 4});

  final int index;
  final int length;
  final String name;
  final String category;
  final String experience;
  final String language;
  final String rating;

  @override
  State<DoctorsCard> createState() => _DoctorsCardState();
}

class _DoctorsCardState extends State<DoctorsCard> {

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(width: 1, color: AppColors.c_200),
        ),
        child: Material(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24.r),
          child: InkWell(
            borderRadius: BorderRadius.circular(24.r),
            onTap: () {
              Navigator.pushNamed(context, RouteNames.doctorDetailScreen);
            },
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: SizedBox(
                      width: 105.w,
                      height: 105.w,
                      child: Image.asset(
                        AppIcons.drWatson,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  16.pw,
                  SizedBox(
                    width: 160.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontFamily: "Urbanist",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.c_900,
                          ),
                        ),
                        4.ph,
                        Text(
                          widget.category,
                          style: TextStyle(
                            fontFamily: "Urbanist",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.c_700,
                          ),
                        ),
                        6.ph,
                        Text(
                          widget.experience,
                          style: TextStyle(
                            fontFamily: "Urbanist",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.c_700,
                          ),
                        ),
                        6.ph,
                        Row(
                          children: [
                            Text(
                              widget.language,
                              style: TextStyle(
                                fontFamily: "Urbanist",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.c_700,
                              ),
                            ),
                            6.pw,
                            SizedBox(
                              width: 16.w,
                              height: 16.w,
                              child: SvgPicture.asset(
                                AppIcons.getSvg(
                                  name: AppIcons.star,
                                  iconType: IconType.bold,
                                ),
                                colorFilter: const ColorFilter.mode(
                                    AppColors.orange, BlendMode.srcIn),
                              ),
                            ),
                            6.pw,
                            Text(
                              widget.rating,
                              style: TextStyle(
                                fontFamily: "Urbanist",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.c_700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      40.ph,
                      GestureDetector(
                        onTap: (){
                          _makePhoneCall("+998998999739");
                        },
                        child: Container(
                          width: 45.w,
                          height: 45.w,
                          padding: EdgeInsets.all(12.r),
                          decoration: const BoxDecoration(
                            color: AppColors.primary400,
                            shape: BoxShape.circle
                          ),
                          child: SvgPicture.asset(
                            AppIcons.getSvg(
                              name: AppIcons.call,
                              iconType: IconType.bold,
                            ),
                            colorFilter: const ColorFilter.mode(
                                AppColors.white,
                                BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
