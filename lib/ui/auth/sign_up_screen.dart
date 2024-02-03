import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/cubits/sign_cubit/sign_cubit.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GlobalAppBar(
        onTap: (){
          Navigator.pop(context);
        },
      ),
      body: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.signLogo, width: 120.w),
                30.ph,
                Text(
                  "Create New Account",
                  style: TextStyle(
                      color: AppColors.c_900,
                      fontFamily: "Urbanist",
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700),
                ),
                30.ph,
                GlobalTextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: state.emailController,
                  onChanged: (email) {
                    context.read<SignUpCubit>().updateEmail(email);
                  },
                  focusNode: state.emailFocusNode,
                  hintText: 'Email',
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SvgPicture.asset(AppIcons.message,
                        colorFilter:
                            ColorFilter.mode(state.iconColor, BlendMode.srcIn)),
                  ),
                ),
                20.ph,
                GlobalTextField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  controller: state.passwordController,
                  onChanged: (password) {
                    context.read<SignUpCubit>().updatePassword(password);
                  },
                  focusNode: state.passwordFocusNode,
                  hintText: 'Password',
                  obscureText: state.isObscure,
                  suffixIcon: IconButton(
                    splashRadius: 20.r,
                    onPressed: () {
                      context.read<SignUpCubit>().toggleObscure();
                    },
                    icon: SvgPicture.asset(state.isObscure?AppIcons.hide:AppIcons.show,
                      colorFilter: ColorFilter.mode(state.iconColor2, BlendMode.srcIn),)
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SvgPicture.asset(
                      AppIcons.lock,
                      colorFilter:
                          ColorFilter.mode(state.iconColor2, BlendMode.srcIn),
                    ),
                  ),
                ),
                50.ph,
                GlobalButton(
                  title: "Sign up",
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.registerPage);
                  },
                  color: AppColors.primary,
                  textColor: Colors.white,
                ),
                20.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: AppColors.c_500,
                          fontFamily: "Urbanist",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteNames.signInScreen);
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              color: AppColors.primary,
                              fontFamily: "Urbanist",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
