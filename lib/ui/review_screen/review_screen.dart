import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/review_screen/widgets/review_card.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  int selectRate = 0;
  List<String> doctorsRate = [
    "All",
    "5",
    "4",
    "3",
    "2",
    "1",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Review",
        action: [
          getIcon(AppIcons.moreCircle, context: context, onTap: (){})
        ],
        onTap: (){
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14.h),
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
                                    width: 2.w,
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
          Expanded(
            child: ListView(
              children: [
                ...List.generate(5, (index){
                  return ReviewCard(index: index);
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
