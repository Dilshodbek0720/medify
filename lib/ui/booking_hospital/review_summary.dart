import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/booking_hospital/widgets/booking_card.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class ReviewSummaryScreen extends StatefulWidget {
  const ReviewSummaryScreen({super.key});

  @override
  State<ReviewSummaryScreen> createState() => _ReviewSummaryScreenState();
}

class _ReviewSummaryScreenState extends State<ReviewSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_50,
      appBar: GlobalAppBar(
        background: AppColors.c_50,
        title: "Review Summary",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              children: [
                const BookingCard(),
                24.ph,
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24.r),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Date",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.c_700,
                                    fontSize: 14.sp)),
                            Text("Dec 23 - Dec 27 2022",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.c_800,
                                    fontSize: 16.sp)),
                          ],
                        ),
                        20.ph,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Check in",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.c_700,
                                    fontSize: 14.sp)),
                            Text("December 23, 2022",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.c_800,
                                    fontSize: 16.sp)),
                          ],
                        ),
                        20.ph,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Check out",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.c_700,
                                    fontSize: 14.sp)),
                            Text("December 27, 2022",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.c_800,
                                    fontSize: 16.sp)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                24.ph,
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24.r),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Amount (5 days)",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.c_700,
                                    fontSize: 14.sp)),
                            Text("\$145.00",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.c_800,
                                    fontSize: 16.sp)),
                          ],
                        ),
                        20.ph,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tax",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.c_700,
                                    fontSize: 14.sp)),
                            Text("\$5.00",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.c_800,
                                    fontSize: 16.sp)),
                          ],
                        ),
                        20.ph,
                        const Divider(),
                        20.ph,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.c_700,
                                    fontSize: 14.sp)),
                            Text("\$150.00",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.c_800,
                                    fontSize: 16.sp)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                24.ph,
                DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r), color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.all(24.r),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.masterCard),
                        16.pw,
                        Text("•••• •••• •••• •••• 4679",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColors.c_900,
                                fontSize: 18.sp)),
                        const Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: Text(tr("change"),
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primary500,
                                    fontSize: 16.sp)))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: GlobalButton(color: AppColors.primary, textColor: Colors.white, title: tr("continue"), onTap: (){
              Navigator.pushNamed(context, RouteNames.ourRec);
              print(DateTime.now());
            }),
          ),
          40.ph,
        ],
      ),
    );
  }
}