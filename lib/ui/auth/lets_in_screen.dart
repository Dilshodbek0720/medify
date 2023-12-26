import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class LetsYouInScreen extends StatelessWidget {
  const LetsYouInScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.c_900),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: SvgPicture.asset(
                  AppIcons.letsYouIn,
                  width: 237.w,
                  height: 200.h,
                )),
            20.ph,
            Text(
              "Let’s you in",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primary,
                  fontFamily: "Urbanist",
                  fontSize: 48.sp,
                  fontWeight: FontWeight.w700),
            ),
            40.ph,
            GlobalButton(title: "Create account", onTap: () {
              Navigator.pushNamed(context, RouteNames.signUpScreen);
            }, color: AppColors.primary, textColor: Colors.white,),
            20.ph,
            Row(
              children: [
                const Expanded(child: Divider(color: AppColors.c_400)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    "or",
                    style: TextStyle(
                        color: AppColors.c_700,
                        fontFamily: "Urbanist",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Expanded(child: Divider(color: AppColors.c_400))
              ],
            ),
            20.ph,
            GlobalButton(title: "Sign in with password", onTap: () {
              Navigator.pushNamed(context, RouteNames.signInScreen);
            }, color: AppColors.primary, textColor: Colors.white,),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
