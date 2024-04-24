import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/tab_box/history/widgets/history_appbar.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/meet/widgets/meet_appbar.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/meet/widgets/meet_drawer.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class MeetScreen extends StatefulWidget {
  const MeetScreen({super.key});

  @override
  State<MeetScreen> createState() => _MeetScreenState();
}

class _MeetScreenState extends State<MeetScreen> {
  int screenIndex = 0;
  bool isSelected = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        drawer: MeetDrawerWidget(
          cancelOnTap: () {
            _closeDrawer();
          },
          onChanged: (int value) {
            if (value == 11) {
            } else {
              setState(() {
                screenIndex = value;
              });
            }
            Navigator.pop(context);
          },
          selectedIndex: screenIndex,
        ),
        key: _scaffoldKey,
        appBar: MeetAppbar(
          onTapOpen: () {
            _openDrawer();
          },
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                    child: Container(
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(width: 1, color: AppColors.c_400)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              children: [
                                Text(
                                  "Функция Medify Conference",
                                  style: TextStyle(
                                      color: AppColors.c_900,
                                      fontSize: 20.sp,
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.2),
                                ),
                                12.ph,
                                Text(
                                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown.",
                                  style: TextStyle(
                                      color: AppColors.c_900,
                                      fontSize: 16.sp,
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.2),
                                ),
                                12.ph,
                                Row(
                                  children: [
                                    TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'ОК',
                                          style: TextStyle(
                                              color: const Color(0xFF417F7C),
                                              fontSize: 16.sp,
                                              fontFamily: 'Urbanist',
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.2),
                                        ),),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Подробнее',
                                          style: TextStyle(
                                              color: const Color(0xFF417F7C),
                                              fontSize: 16.sp,
                                              fontFamily: 'Urbanist',
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.2),
                                        ),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width/4,
                            height: MediaQuery.of(context).size.width/4,
                            child: Image.asset(AppIcons.meetImage),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                      color: const Color(0xFF00668B),
                      borderRadius: BorderRadius.circular(24.r)),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 32.w,
                        width: 32.w,
                        child: const Icon(
                          Icons.videocam_outlined,
                          color: AppColors.white,
                        ),
                      ),
                      12.pw,
                      Text(
                        'Позвонить',
                        style:
                            TextStyle(color: AppColors.white, fontSize: 18.sp),
                      ),
                      10.pw,
                    ],
                  ),
                ),
                24.pw,
              ],
            ),
            24.ph,
          ],
        ),
      ),
    );
  }
}
