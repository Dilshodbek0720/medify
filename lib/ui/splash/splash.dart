import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/fonts/text_styles.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/screen_size.dart';
import 'package:medify/utils/size/size_extension.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init()async{
    await Future.delayed(const Duration(seconds: 3));
    if(context.mounted){
      // StorageRepository.getString(StorageKeys.userToken).isEmpty ? Navigator.pushReplacementNamed(context, RouteNames.loginScreen) :
      Navigator.pushReplacementNamed(context, RouteNames.tabBox);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            300.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*60/figmaWidth,
                  child: Image.asset(AppIcons.splash),
                ),
                6.pw,
                Text("Medify",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.h1Bold.copyWith(color: AppColors.c_900),
                )
              ],
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width*100/figmaWidth,
              child: Lottie.asset(AppIcons.loader),
            ),
            100.ph,
          ],
        ),
      ),
    );
  }
}