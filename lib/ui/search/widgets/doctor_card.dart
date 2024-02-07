import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class DoctorsCard extends StatefulWidget {
  const DoctorsCard(
      {super.key,
      required this.index,
      required this.name,
      required this.category,
      required this.hospital,
      required this.rating,
      this.length = 4});

  final int index;
  final int length;
  final String name;
  final String category;
  final String hospital;
  final String rating;

  @override
  State<DoctorsCard> createState() => _DoctorsCardState();
}

class _DoctorsCardState extends State<DoctorsCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
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
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      AppIcons.drWatson,
                      width: 60.w,
                    ),
                  ),
                  16.pw,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 200.w,
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                fontFamily: "Urbanist",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.c_900,
                              ),
                            ),
                          ),
                          Text(
                            widget.rating,
                            style: TextStyle(
                              fontFamily: "Urbanist",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.c_900,
                            ),
                          ),
                          8.pw,
                          GestureDetector(
                              onTap: () {

                              },
                              child: SvgPicture.asset(
                                  AppIcons.starIcon
                              ),)
                        ],
                      ),
                      4.ph,
                      Text(
                        widget.category,
                        style: TextStyle(
                          fontFamily: "Urbanist",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.c_700,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
