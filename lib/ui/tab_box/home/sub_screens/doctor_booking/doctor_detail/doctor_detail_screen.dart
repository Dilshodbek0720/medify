import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/review_screen/widgets/review_card.dart';
import 'package:medify/ui/tab_box/home/sub_screens/doctor_booking/widgets/doctor_detail_item.dart';
import 'package:medify/ui/tab_box/home/sub_screens/doctor_booking/widgets/doctor_detail_widget.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class DoctorDetailScreen extends StatefulWidget {
  const DoctorDetailScreen({super.key});

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: "Dr. Jenny Watson",
        action: [
          getIcon(AppIcons.search, context: context, onTap: () {}),
          getIcon(AppIcons.moreCircle, context: context, onTap: () {}),
          10.pw,
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              24.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: const DoctorDetailItem(
                  index: 0,
                  name: 'Dr. Jenny Watson',
                  category: 'Immunologists',
                  hospital: 'Christ Hospital',
                  rate: '4.4',
                  views: '4,942',
                ),
              ),
              24.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DoctorDetailWidget(
                      icon: AppIcons.user3,
                      title: "5,000+",
                      onTap: () {},
                      description: 'patients',
                      onTapWidget: () {},
                    ),
                    DoctorDetailWidget(
                      icon: AppIcons.activity,
                      title: "10+",
                      onTap: () {},
                      description: 'years exper..',
                      onTapWidget: () {},
                    ),
                    DoctorDetailWidget(
                      icon: AppIcons.user3,
                      title: "4.8",
                      onTap: () {},
                      description: 'rating',
                      onTapWidget: () {},
                    ),
                    DoctorDetailWidget(
                      icon: AppIcons.user3,
                      title: "4,942",
                      onTap: () {},
                      description: 'reviews',
                      onTapWidget: () {},
                    ),
                  ],
                ),
              ),
              24.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  "About me",
                  style: TextStyle(
                    color: AppColors.c_900,
                    fontSize: 20.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              8.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  "Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation. view more",
                  style: TextStyle(
                      color: AppColors.c_800,
                      fontSize: 14.sp,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2),
                ),
              ),
              20.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  "Working Time",
                  style: TextStyle(
                    color: AppColors.c_900,
                    fontSize: 20.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              8.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  'Monday - Friday, 08.00 AM - 20.00 PM',
                  style: TextStyle(
                      color: AppColors.c_800,
                      fontSize: 14.sp,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2),
                ),
              ),
              20.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    Text(
                      'Reviews',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.reviewScreen);
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(
                            fontFamily: "Urbanist",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ),
              const ReviewCard(index: 4),
            ],
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: GlobalButton(
              onTap: () {},
              textColor: AppColors.white,
              color: AppColors.primary,
              title: "Book Appointment",
            ),
          )
        ],
      ),
    );
  }
}
