import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class LetsYouInScreen2 extends StatelessWidget {
  const LetsYouInScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            100.ph,
            Center(
                child: SvgPicture.asset(
                  AppIcons.letsYouIn,
                  width: 237.w,
                  height: 200.h,
                )),
            60.ph,
            Text(
              "Все виды услуг медицины в одном приложении Medify. Это удобно и просто!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.black,
                  fontFamily: "Urbanist",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700),
            ),
            90.ph,
            GlobalButton(
              radius: 0,
              title: "ВОЙТИ",
              onTap: () {
                Navigator.pushNamed(context, RouteNames.signUpScreen);
              },
              color: AppColors.primary,
              textColor: Colors.white,
            ),
            20.ph,
            GlobalButton(
              borderColor: AppColors.c_400,
              radius: 0,
              title: "Нет учетной записи? Создайте ее.",
              onTap: () {
                Navigator.pushNamed(context, RouteNames.signInScreen);
              },
              color: AppColors.white,
              textColor: Colors.black,
            ),
            // 20.ph,
            // TextButton(
            //     onPressed: () {
            //       // Navigator.pushNamed(context, RouteNames.forgotPassword);
            //     },
            //     child: Text(
            //       "Перейти к моим фотографиям",
            //       style: TextStyle(
            //           color: AppColors.primary,
            //           fontFamily: "Urbanist",
            //           fontSize: 16.sp,
            //           fontWeight: FontWeight.w600),
            //     )),
            const Spacer()
          ],
        ),
      ),
    );
  }
}