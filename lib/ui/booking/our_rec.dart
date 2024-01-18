import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/booking/widgets/type_card.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class OurRecommendationScreen extends StatefulWidget {
  const OurRecommendationScreen({super.key});

  @override
  State<OurRecommendationScreen> createState() => _OurRecommendationScreenState();
}

class _OurRecommendationScreenState extends State<OurRecommendationScreen> {
  int selectType = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_50,
      appBar: GlobalAppBar(
        background: AppColors.c_50,
        title: "Our Recommendation",
        onTap: (){
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(left: 24.w,right: 24.w,bottom: 24.h),
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.59.r,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w
              ),
              itemBuilder: (BuildContext context, int index) {
                return const TypeCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
