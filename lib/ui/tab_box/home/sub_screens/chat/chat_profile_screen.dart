import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class ChatProfileScreen extends StatefulWidget {
  const ChatProfileScreen({super.key});

  @override
  State<ChatProfileScreen> createState() => _ChatProfileScreenState();
}

class _ChatProfileScreenState extends State<ChatProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child: Image.asset(AppIcons.profileChat, fit: BoxFit.fitWidth)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              child: Text(
                "Daniel Austin",
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.c_900),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: AppColors.c_200,
                    borderRadius: BorderRadius.circular(16.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About you",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.c_700),
                      ),
                      5.ph,
                      Text(
                        "Всё полезно, что на макет влезло. \n\nПишу в @itsets",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.c_900),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: AppColors.c_200,
                    borderRadius: BorderRadius.circular(16.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "username",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.c_700),
                          ),
                          5.ph,
                          Text(
                            "@s_pokrovitel",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary),
                          ),
                        ],
                      ),
                      SvgPicture.asset(AppIcons.qrCode,
                          colorFilter: const ColorFilter.mode(
                              AppColors.c_900, BlendMode.srcIn)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: AppColors.c_200,
                    borderRadius: BorderRadius.circular(16.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.c_700),
                      ),
                      5.ph,
                      Text(
                        "+7 (911) 234-56-78",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            10.ph,
            SizedBox(
                height:50,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: AppColors.c_200
                  ),
                  child: TabBar(
                      isScrollable: true,
                      labelColor: AppColors.c_900,
                      unselectedLabelColor: AppColors.c_500,
                      tabAlignment: TabAlignment.center,
                      indicatorWeight: 4,
                      indicatorColor: AppColors.primary,
                      labelStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Urbanist'),
                      tabs: const <Widget>[
                        Tab(text: "General groups",),
                        Tab(text: "Media"),
                        Tab(text: "File"),
                        Tab(text: "History"),
                        Tab(text: "Voice"),
                        Tab(text: "Links"),
                      ],
                  ),
                ),),
            SizedBox(
              height: MediaQuery.of(context).size.height/1.5,
              child: TabBarView(children: [
                Center(
                  child: Text("General groups",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Urbanist'),),
                ),
                Center(
                  child: Text("Media",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Urbanist'),),
                ),
                Center(
                  child: Text("File",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Urbanist'),),
                ),
                Center(
                  child: Text("History",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Urbanist'),),
                ),
                Center(
                  child: Text("Voice",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Urbanist'),),
                ),
                Center(
                  child: Text("Links",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Urbanist'),),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
