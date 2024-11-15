import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:medify/cubits/sign_cubit/sign_cubit.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({super.key});

  @override
  State<SignUpScreen2> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen2> {
  var phoneFormatter = MaskTextInputFormatter(
      initialText: "+998",
      mask: '## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const GlobalAppBar(
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    primary: false,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.signLogo,
                                  width: 60.w, height: 60.h),
                              20.pw,
                              Text(
                                "Medify",
                                style: TextStyle(
                                    color: AppColors.c_700,
                                    fontFamily: "Urbanist",
                                    fontSize: 28.w,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          30.ph,
                          Text(
                            "Войти",
                            style: TextStyle(
                                color: AppColors.c_900,
                                fontFamily: "Urbanist",
                                fontSize: 28.w,
                                fontWeight: FontWeight.w700),
                          ),
                          20.ph,
                          Text(
                            "Войти. Зайдите в свой кабинет Medify, и делайте свою жизнь удобнее",
                            style: TextStyle(
                                color: AppColors.c_600,
                                fontFamily: "Urbanist",
                                fontSize: 18.w,
                                fontWeight: FontWeight.w700),
                          ),
                          30.ph,
                          GlobalTextField(
                            radius: 0,
                            borderColor: AppColors.c_500,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            controller: state.emailController,
                            onChanged: (email) {
                              context.read<SignUpCubit>().updateEmail(email);
                            },
                            focusNode: state.emailFocusNode,
                            hintText: "Email",
                          ),
                          24.ph,
                          GlobalTextField(
                            radius: 0,
                            borderColor: AppColors.c_500,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            maskFormatter: phoneFormatter,
                            controller: state.phoneController,
                            prefixIcon: SizedBox(
                              width: 60.w,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 6.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "+998",
                                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                          height: 20 / 14,
                                          color: AppColors.c_900,
                                          fontSize: 17.sp, fontWeight: FontWeight.w400),
                                    ),
                                    6.pw,
                                  ],
                                ),
                              ),
                            ),
                            onChanged: (phone) {
                              context.read<SignUpCubit>().updatePhone(phone);
                            },
                            focusNode: state.phoneFocusNode,
                            hintText: "Phone",
                          ),
                          24.ph,
                          GlobalTextField(
                            radius: 0,
                            borderColor: AppColors.c_500,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            controller: state.passwordController,
                            obscureText: state.isObscure,
                            suffixIcon: IconButton(
                                splashRadius: 20.r,
                                onPressed: () {
                                  context.read<SignUpCubit>().toggleObscure();
                                },
                                icon: SvgPicture.asset(
                                  state.isObscure ? AppIcons.hide : AppIcons.show,
                                  colorFilter:
                                  ColorFilter.mode(state.iconColor2, BlendMode.srcIn),
                                )),
                            onChanged: (password) {
                              context.read<SignUpCubit>().updatePassword(password);
                            },
                            focusNode: state.passwordFocusNode,
                            hintText: "Password",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.w, top: 24.h, right: 24.w, bottom: 36.h),
                  child: GlobalButton(
                      radius: 0,
                      color: AppColors.primary,
                      textColor: Colors.white,
                      title: "Нет учетной записи? Создайте ее.",
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.selectContactScreen);
                      },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
