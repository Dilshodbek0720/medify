import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/ui/tab_box/appointment/widgets/appointment_drawer.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/fonts/text_styles.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  // int isSelect = 0;
  int screenIndex = 0;
  List<String> screenNames = [
    "Upcoming",
    "Passed",
    "Canceled",
    "Re-schedualed",
  ];

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
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(screenNames[screenIndex], style: AppTextStyle.h4Bold.copyWith(color: AppColors.c_900)),
          actions: [
            GestureDetector(
              onTap: (){
                _openDrawer();
              },
              child: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: SvgPicture.asset(AppIcons.drawer),
              ),
            ),
            10.pw
          ],
        ),
        key: _scaffoldKey,
        drawer: AppointmentDrawerWidget(cancelOnTap: (){
          _closeDrawer();
        }, onChanged: (int value) {
          if(value==11){
      
          }else{
            setState(() {
              screenIndex = value;
            });
          }
          Navigator.pop(context);
        }, selectedIndex: screenIndex,),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                children: [
                  10.ph,
                  ...List.generate(
                    10,
                        (index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15.r),
                          onTap: () {
      
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(color: AppColors.c_200),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15.r),
                              child: Row(
                                children: [
                                  SizedBox(
                                      height: 80,
                                      child: Image.asset(AppIcons.deadpool)),
                                  15.pw,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "DeadPool",
                                        style: TextStyle(
                                            color: AppColors.c_800,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      15.ph,
                                      Text(
                                        "Dec 18, 2023 · 19:30 - 21:48",
                                        style: TextStyle(
                                            color: AppColors.c_700,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  SvgPicture.asset(AppIcons.arrowRight2)
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  20.ph,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
