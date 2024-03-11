import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/forgot_password/widgets/forgot_password_selector.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/fonts/text_styles.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class VerifyWithScreen extends StatefulWidget {
  const VerifyWithScreen({super.key});

  @override
  State<VerifyWithScreen> createState() => _VerifyWithScreenState();
}

class _VerifyWithScreenState extends State<VerifyWithScreen> {
  int pressed = -1;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: (){
      Navigator.pop(context);
    },
    title: 'Select Contact',
    centerTitle: true,
    ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ListView(
                children: [
                  20.ph,
                  Image.asset(
                    AppIcons.forgotPasswordImage,
                    height: height * 0.285,
                    width: width * 0.64,
                  ),
                  24.ph,
                  Text(
                      'Select which contact details should we use to verify account',
                      style: AppTextStyle.h6Bold.copyWith(fontSize: 18.sp, letterSpacing: 0.2.w, fontWeight: FontWeight.w500)),
                  24.ph,
                  ForgotPasswordSelector(
                    title: 'via SMS:',
                    subtitle: '\n+1 111 ******99',
                    svg: 'assets/svg/bold/chat.svg',
                    onTap: () {
                      setState(() {
                        pressed = 0;
                      });
                    },
                    pressed: pressed==0,
                  ),
                  24.ph,
                  ForgotPasswordSelector(
                    title:'via Email:',
                    subtitle: '\nand***ley@yourdomain.com',
                    svg: 'assets/svg/bold/message.svg',
                    onTap: () {
                      setState(() {
                        pressed = 1;
                      });
                    },
                    pressed: pressed==1,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.r),
            child: GlobalButton(color: AppColors.primary, textColor: AppColors.white, title: "Next", onTap: (){
              if(pressed != -1){
                Navigator.pushNamed(context, RouteNames.verifyScreen);
              }
            }),
          )
        ],
      ),
    );
  }
}
