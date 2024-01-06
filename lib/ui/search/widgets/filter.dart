import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

void showBottomSheetWidget(BuildContext context) {
  int selectType = 0;
  int selectRate = 0;
  List<String> doctorsType = [
    "All",
    "General",
    "Dentist",
    "Nutritionist",
    "Immunologists",
    "Allergists",
    "Neurologists",
    "Cardiologists"
  ];
  List<String> doctorsRate = [
    "All",
    "5",
    "4",
    "3",
    "2",
    "1",
  ];

  showModalBottomSheet(
      showDragHandle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(48.r), topRight: Radius.circular(48.r))),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Filter",
                      style: TextStyle(
                        fontFamily: "Urbanist",
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.c_900,
                      ),
                    ),
                  ],
                ),
                12.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: const Divider(
                    color: AppColors.c_200,
                    thickness: 2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    "Speciality",
                    style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.c_900,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: SizedBox(
                    height: 38.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        18.pw,
                        ...List.generate(
                            doctorsType.length,
                            (index) => Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 6.w),
                                  child: InkWell(
                                      borderRadius: BorderRadius.circular(100),
                                      onTap: () {
                                        if (selectType == index) {
                                          selectType = 0;
                                        } else {
                                          selectType = index;
                                        }
                                        setState(() {});
                                      },
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
                                          child: Text(
                                            doctorsType[index],
                                            style: TextStyle(
                                              fontFamily: "Urbanist",
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              color: selectType==index?Colors.white:AppColors.primary500,
                                            ),
                                          ))),
                                )),
                        18.pw,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    "Rating",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.c_900,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: SizedBox(
                    height: 38.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        18.pw,
                        ...List.generate(
                            doctorsRate.length,
                                (index) => Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 6.w),
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: () {
                                    if (selectRate == index) {
                                      selectRate = 0;
                                    } else {
                                      selectRate = index;
                                    }
                                    setState(() {});
                                  },
                                  child: Ink(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w, vertical: 8.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(100.r),
                                        color: selectRate == index
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
                                                  selectRate==index?Colors.white:AppColors.primary500, BlendMode.srcIn)
                                          ),
                                          8.pw,
                                          Text(
                                            doctorsRate[index],
                                            style: TextStyle(
                                              fontFamily: "Urbanist",
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              color: selectRate==index?Colors.white:AppColors.primary500,
                                            ),
                                          ),
                                        ],
                                      ))),
                            )),
                        18.pw,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: const Divider(
                    color: AppColors.c_200,
                    thickness: 2,
                  ),
                ),
                24.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 184.w,
                          child: GlobalButton(color: AppColors.primary100, textColor: AppColors.primary500, title: "Reset", onTap: (){
                            selectRate = 0;
                            selectType = 0;
                            setState((){});
                          })),
                      12.pw,
                      SizedBox(
                          width:184.w,child: GlobalButton(color: AppColors.primary500, textColor: AppColors.white, title: "Apply", onTap: (){
                            Navigator.pop(context);
                      }))
                    ],
                  ),
                ),
                48.ph
              ],
            );
          },
        );
      });
}
