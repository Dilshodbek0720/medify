import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:medify/cubits/auth_cubit/auth_cubit.dart';
import 'package:medify/cubits/sign_cubit/sign_cubit.dart';
import 'package:medify/data/local/storage_repository/storage_repository.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/models/user/user_model.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/constants/storage_keys.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class SignInScreen2 extends StatefulWidget {
  const SignInScreen2({super.key});

  @override
  State<SignInScreen2> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen2> {
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
          return ListView(
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
                    "Создание учетной записи",
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
                    // suffixIcon: Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                    //   child: SvgPicture.asset(AppIcons.message,
                    //       colorFilter: ColorFilter.mode(
                    //           state.iconColor3, BlendMode.srcIn)),
                    // ),
                  ),
                  20.ph,
                  GlobalTextField(
                    radius: 0,
                    borderColor: AppColors.c_500,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    controller: state.passwordController,
                    suffixIcon: IconButton(
                      splashRadius: 20.r,
                      onPressed: () {
                        context.read<SignUpCubit>().toggleObscure();
                      },
                      icon: SvgPicture.asset(
                        state.isObscure ? AppIcons.hide : AppIcons.show,
                        colorFilter:
                            ColorFilter.mode(state.iconColor2, BlendMode.srcIn),
                      ),
                    ),
                    onChanged: (password) {
                      context.read<SignUpCubit>().updatePassword(password);
                    },
                    focusNode: state.passwordFocusNode,
                    hintText: 'Password',
                    obscureText: state.isObscure,
                    // prefixIcon: Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                    //   child: SvgPicture.asset(
                    //     AppIcons.lock,
                    //     colorFilter:
                    //     ColorFilter.mode(state.iconColor2, BlendMode.srcIn),
                    //   ),
                    // ),
                  ),
                  20.ph,
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.forgotPassword);
                      },
                      child: Text(
                        "Использовать существующий адрес электронной ПОЧТЫ",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontFamily: "Urbanist",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),),
                  40.ph,
                  GlobalButton(
                    title: "Sign in",
                    onTap: () async{
                      UniversalData data = await context.read<AuthCubit>().login(context: context, password: state.passwordController.text, email: state.emailController.text);
                      if(data.error.isEmpty){
                        UserModel userModel = data.data;
                        String token = data.token;
                        await StorageRepository.putString(
                          StorageKeys.userToken,
                          token,
                        );
                        if(userModel.emailVerified && context.mounted){
                          context.read<SignUpCubit>().clearTextFields();
                          Navigator.pushNamed(context, RouteNames.successful, arguments: "sign_in");
                        }else{

                        }
                      }
                    },
                    color: AppColors.primary,
                    textColor: Colors.white,
                    radius: 0,
                  ),
                  20.ph,
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
