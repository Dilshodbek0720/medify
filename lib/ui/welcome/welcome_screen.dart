import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/utils/fonts/text_styles.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/screen_size.dart';
import 'package:medify/utils/size/size_extension.dart';

import '../../utils/colors/app_colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {


  @override
  void initState() {
    _init();
    super.initState();
  }
  _init()async{
    await Future.delayed(const Duration(seconds: 3));
    if(context.mounted){
      Navigator.pushReplacementNamed(context, RouteNames.onBoardingPages);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            75.ph,
            Image.asset(AppIcons.welcome,
              width: MediaQuery.of(context).size.width,
            ),
            70.ph,
            Text("Welcome to\n Medify! 👋",
              style: AppTextStyle.h1Bold.copyWith(color: AppColors.primary),
            ),
            32.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text("Your grin lights up our day, keep health close. Can't wait for your family joyfest!",
                style: AppTextStyle.h6Bold.copyWith(
                  color: AppColors.c_900,
                    fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}