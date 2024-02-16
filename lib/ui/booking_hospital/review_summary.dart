import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
// import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/search/widgets/doctor_card.dart';
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
                const DoctorsCard(
                    length: 10,
                    index: 0,
                    name: "Dr. Jenny Watson",
                    category: "Immunologists",
                    hospital: "Christ Hospital",
                    rating: "4.4"),
                24.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        color: AppColors.c_900,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Change",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: AppColors.c_900,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Colors.greenAccent.withOpacity(0.1),
                          border: Border.all(color: Colors.green)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 12.h),
                        child: SvgPicture.asset(
                          AppIcons.getSvg(
                              name: AppIcons.calendar, iconType: IconType.bold),
                          colorFilter: const ColorFilter.mode(
                              AppColors.green, BlendMode.srcIn),
                          width: 25,
                        ),
                      ),
                    ),
                    12.pw,
                    Text(
                      "Friday, Dec 25, 2023 | 02:00 PM",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: AppColors.c_700,
                      ),
                    )
                  ],
                ),
                24.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Reason",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        color: AppColors.c_900,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Change",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: AppColors.c_900,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Colors.greenAccent.withOpacity(0.1),
                          border: Border.all(color: Colors.green)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 12.h),
                        child: SvgPicture.asset(
                          AppIcons.medical,
                          colorFilter: const ColorFilter.mode(
                              AppColors.green, BlendMode.srcIn),
                          width: 25,
                        ),
                      ),
                    ),
                    12.pw,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chest pain",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: AppColors.c_700,
                          ),
                        ),
                        Text(
                          "Crumps in back side. Especially...",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: AppColors.c_700,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                24.ph,
                Text(
                  "Payment Detail",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    color: AppColors.c_900,
                  ),
                ),
                10.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Consultation",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: AppColors.c_700,
                      ),
                    ),
                    Text(
                      "\$60.00",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: AppColors.c_700,
                      ),
                    ),
                  ],
                ),
                5.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Admin Fee",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: AppColors.c_700,
                      ),
                    ),
                    Text(
                      "\$5.00",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: AppColors.c_700,
                      ),
                    ),
                  ],
                ),
                5.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discount",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: AppColors.c_700,
                      ),
                    ),
                    Text(
                      "-\$10.00",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: AppColors.c_700,
                      ),
                    ),
                  ],
                ),
                5.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.c_900,
                      ),
                    ),
                    Text(
                      "\$55.00",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
                24.ph,
                Text(
                  "Payment Method",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    color: AppColors.c_900,
                  ),
                ),
                12.ph,
                DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.white),
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
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteNames.paymentBookingsScreen);
                          },
                          child: Text(
                            tr("change"),
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary500,
                                fontSize: 16.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: GlobalButton(
                color: AppColors.deepPurple,
                textColor: Colors.white,
                title: tr("continue"),
                onTap: () {
                  // Navigator.pushNamed(context, RouteNames.ourRec);
                  print(DateTime.now());
                }),
          ),
          40.ph,
        ],
      ),
    );
  }
}
