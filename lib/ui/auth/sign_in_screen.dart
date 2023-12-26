import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isObscure = true;
  bool isChecked = false;
  final FocusNode focusNode = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  Color iconColor = AppColors.c_500;
  Color iconColor2 = AppColors.c_500;

  @override
  void initState() {
    controllerEmail.addListener(() {
      if (controllerEmail.text.isNotEmpty) {
        if (focusNode.hasFocus) {
          setState(() {
            iconColor = AppColors.primary;
          });
        } else {
          setState(() {
            iconColor = AppColors.c_900;
          });
        }
      } else {
        if (focusNode.hasFocus) {
          setState(() {
            iconColor = AppColors.primary;
          });
        } else {
          setState(() {
            iconColor = AppColors.c_500;
          });
        }
      }
    });
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          iconColor = AppColors.primary;
        });
      } else {
        if (controllerEmail.text.isNotEmpty) {
          setState(() {
            iconColor = AppColors.c_900;
          });
        } else {
          setState(() {
            iconColor = AppColors.c_500;
          });
        }
      }
    });
    controllerPassword.addListener(() {
      if (controllerPassword.text.isNotEmpty) {
        if (focusNode2.hasFocus) {
          setState(() {
            iconColor2 = AppColors.primary;
          });
        } else {
          setState(() {
            iconColor2 = AppColors.c_900;
          });
        }
      } else {
        if (focusNode2.hasFocus) {
          setState(() {
            iconColor2 = AppColors.primary;
          });
        } else {
          setState(() {
            iconColor2 = AppColors.c_500;
          });
        }
      }
    });
    focusNode2.addListener(() {
      if (focusNode2.hasFocus) {
        setState(() {
          iconColor2 = AppColors.primary;
        });
      } else {
        if (controllerPassword.text.isNotEmpty) {
          setState(() {
            iconColor2 = AppColors.c_900;
          });
        } else {
          setState(() {
            iconColor2 = AppColors.c_500;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 56.h,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.c_900),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.signLogo, width: 120.w,height: 120.h),
              30.ph,
              Text(
                "Login to Your Account",
                style: TextStyle(
                    color: AppColors.c_900,
                    fontFamily: "Urbanist",
                    fontSize: 32.w,
                    fontWeight: FontWeight.w700),
              ),
              30.ph,
              SizedBox(
                height: 60.w,
                child: GlobalTextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: controllerEmail,
                  focusNode: focusNode,
                  hintText: 'Email',
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SvgPicture.asset(AppIcons.message,
                        colorFilter:
                        ColorFilter.mode(iconColor, BlendMode.srcIn)),
                  ),
                ),
              ),
              20.ph,
              SizedBox(
                height: 60.w,
                child: GlobalTextField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  controller: controllerPassword,
                  focusNode: focusNode2,
                  hintText: 'Password',
                  obscureText: isObscure,
                  suffixIcon: IconButton(
                    splashRadius: 20.r,
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: iconColor2,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SvgPicture.asset(AppIcons.lock,
                        colorFilter:
                        ColorFilter.mode(iconColor2, BlendMode.srcIn)),
                  ),
                ),
              ),
              20.ph,
              20.ph,
              GlobalButton(title: "Sign in", onTap: () {},color: AppColors.primary, textColor: Colors.white,),
              20.ph,
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot the password?",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontFamily: "Urbanist",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: TextStyle(
                        color: AppColors.c_500,
                        fontFamily: "Urbanist",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.signUpScreen);
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontFamily: "Urbanist",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
              // const Spacer()
            ],
          )
        ],
      ),
    );
  }
}
