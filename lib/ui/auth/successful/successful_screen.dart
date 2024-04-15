import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class SuccessfulScreen extends StatefulWidget {
  const SuccessfulScreen({super.key, required this.successSelectScreen});
  final String successSelectScreen;

  @override
  State<SuccessfulScreen> createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {
  FocusNode emailFocus = FocusNode();
  String title = '';
  String description = '';

  @override
  void initState() {
    title = widget.successSelectScreen == 'sign_in' ? "You're All Set!" : widget.successSelectScreen == 'sign_up' ? 'Successfully verified' : widget.successSelectScreen == 'location' ? 'Welcome to Studify!' : '';
    description = widget.successSelectScreen == 'sign_in' ? "Start exploring the latest movies, showtimes, and ticket options." : widget.successSelectScreen == 'sign_up' ? 'Dear user you have successfully verified your account' : widget.successSelectScreen == 'location' ? "Let's make your dreams into reality" : '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      228.ph,
                      SizedBox(
                        height: 160.w,
                        width: 160.w,
                        child: Image.asset(AppIcons.signSuccess),
                      ),
                      32.ph,
                      Text(title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.c_900,
                          fontSize: 32.sp,
                          fontFamily: "Urbanist",
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      12.ph,
                      Text(description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.c_600,
                          fontSize: 18.sp,
                          fontFamily: "Urbanist",
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(height: 1,),
            Padding(
              padding: EdgeInsets.only(left: 24.w, top: 24.h, right: 24.w, bottom: 36.h),
              child: GlobalButton(
                  radius: 0,
                  color: AppColors.primary, textColor: AppColors.white, title: "Let's Start", onTap: (){
                if(widget.successSelectScreen == 'sign_up'){
                  Navigator.pushNamed(context, RouteNames.editProfileScreen);
                }else if(widget.successSelectScreen == 'location'){
                  Navigator.pushNamed(context, RouteNames.tabBox);
                } else{
                  Navigator.pushNamed(context, RouteNames.tabBox);
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}