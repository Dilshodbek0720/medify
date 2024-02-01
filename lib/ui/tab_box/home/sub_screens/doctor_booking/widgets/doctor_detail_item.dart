import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class DoctorDetailItem extends StatefulWidget {
  const DoctorDetailItem(
      {super.key,
      required this.index,
      required this.name,
      required this.category,
      required this.hospital,
      required this.rate,
      required this.views});

  final int index;
  final String name;
  final String category;
  final String hospital;
  final String rate;
  final String views;

  @override
  State<DoctorDetailItem> createState() => _DoctorDetailItemState();
}

class _DoctorDetailItemState extends State<DoctorDetailItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0x0C04060F),
              blurRadius: 60,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(24.r),
          color: AppColors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(60.r),
                child: Image.asset(
                  AppIcons.drWatson,
                  width: 110.w,
                ),
              ),
              16.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 190.w,
                        child: Text(
                          widget.name,
                          style: TextStyle(
                            fontFamily: "Urbanist",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.c_900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 28.h,
                      width: 222.w,
                      child: const Divider(
                        color: AppColors.c_200,
                        thickness: 1,
                      )),
                  Text(
                    "${widget.category} | ${widget.hospital}",
                    style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.c_800,
                    ),
                  ),
                  14.ph,
                  Row(
                    children: [
                      SvgPicture.asset(
                          AppIcons.getSvg(
                              name: AppIcons.star, iconType: IconType.bulk),
                          width: 16,
                          colorFilter: const ColorFilter.mode(
                              AppColors.primary500, BlendMode.srcIn)),
                      8.pw,
                      Text(
                        "${widget.rate}  (${widget.views} reviews)",
                        style: TextStyle(
                          fontFamily: "Urbanist",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.c_800,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
