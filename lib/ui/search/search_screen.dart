import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/search/widgets/doctor_card.dart';
import 'package:medify/ui/search/widgets/filter.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectType = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_50,
      appBar: AppBar(
        toolbarHeight: 70.h,
        backgroundColor: AppColors.c_50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: getIcon(AppIcons.arrowLeft, context: context, onTap: () {
            Navigator.pop(context);
          }),
        ),
        title: GlobalTextField(
          fillColor: AppColors.c_100,
          suffixIcon: IconButton(
            splashRadius: 20,
            onPressed: () {
              showBottomSheetWidget(context);
            },
            icon: SvgPicture.asset(
                AppIcons.getSvg(name: AppIcons.filter, iconType: IconType.bold),
                colorFilter: const ColorFilter.mode(
                    AppColors.primary500, BlendMode.srcIn)),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SvgPicture.asset(AppIcons.search,
                colorFilter:
                    const ColorFilter.mode(AppColors.c_500, BlendMode.srcIn)),
          ),
          hintText: "Search",
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.name,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 6.w),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        selectType = 0;
                        setState(() {});
                      },
                      child: Ink(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(100.r),
                            color: selectType == 0
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
                                      selectType==0?Colors.white:AppColors.primary500, BlendMode.srcIn)
                              ),
                              8.pw,
                              Text(
                                "Doctors",
                                style: TextStyle(
                                  fontFamily: "Urbanist",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: selectType==0?Colors.white:AppColors.primary500,
                                ),
                              ),
                            ],
                          ))),
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 6.w),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        selectType = 1;
                        setState(() {});
                      },
                      child: Ink(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(100.r),
                            color: selectType == 1
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
                                      selectType==1?Colors.white:AppColors.primary500, BlendMode.srcIn)
                              ),
                              8.pw,
                              Text(
                                "Hospitals",
                                style: TextStyle(
                                  fontFamily: "Urbanist",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: selectType==1?Colors.white:AppColors.primary500,
                                ),
                              ),
                            ],
                          ))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "0 Found",
                  style: TextStyle(
                    fontFamily: "Urbanist",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.c_900,
                  ),
                ),
                TextButton(
                    child: Row(
                      children: [
                        Text(
                          "Default",
                          style: TextStyle(
                            fontFamily: "Urbanist",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary500,
                          ),
                        ),
                        12.pw,
                        SvgPicture.asset(AppIcons.swap,
                            width: 20,
                            colorFilter: const ColorFilter.mode(
                                AppColors.primary500, BlendMode.srcIn)),
                      ],
                    ),
                    onPressed: () {}),
              ],
            ),
            // const NotFoundWidget()
            Expanded(
              child: ListView(
                children: const [
                  DoctorsCard(
                    index: 0,
                    name: 'Dr. Jenny Watson',
                    category: 'Immunologists',
                    hospital: 'Christ Hospital',
                    rate: '4.4',
                    views: '4,942',
                  ),
                  DoctorsCard(
                    index: 1,
                    name: 'Dr. Jenny Baranick',
                    category: 'Allergists',
                    hospital: 'JFK Medical Center',
                    rate: '4.6',
                    views: '3,837',
                  ),
                  DoctorsCard(
                    index: 2,
                    name: 'Dr. Jenny Zirkind',
                    category: 'Neurologists',
                    hospital: 'Franklin Hospital',
                    rate: '4.8',
                    views: '6,362',
                  ),
                  DoctorsCard(
                    index: 3,
                    name: 'Dr. Jenny Wigham',
                    category: 'Cardiologists',
                    hospital: 'The Valley Hospital',
                    rate: '4.8',
                    views: '4,729',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
