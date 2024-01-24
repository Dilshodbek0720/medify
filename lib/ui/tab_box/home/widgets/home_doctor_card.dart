import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class HomeDoctorCard extends StatefulWidget {
  const HomeDoctorCard(
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
  State<HomeDoctorCard> createState() => _HomeDoctorCardState();
}

class _HomeDoctorCardState extends State<HomeDoctorCard> {
  List<int> selectedLike = [-1, -1, -1, -1];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.primary500,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Material(
          color: AppColors.primary500,
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
                  Image.asset(
                    AppIcons.drWatson,
                    width: 110.w,
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
                          12.pw,
                          GestureDetector(
                              onTap: () {
                                if (selectedLike[widget.index] ==
                                    widget.index) {
                                  selectedLike[widget.index] = -1;
                                } else {
                                  selectedLike[widget.index] = widget.index;
                                }
                                setState(() {});
                              },
                              child: SvgPicture.asset(
                                  selectedLike[widget.index] == widget.index
                                      ? AppIcons.getSvg(
                                      name: AppIcons.heart,
                                      iconType: IconType.bold)
                                      : AppIcons.heart,
                                  width: 20.w,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.primary500, BlendMode.srcIn)))
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
        ),
      ),
    );
  }
}
