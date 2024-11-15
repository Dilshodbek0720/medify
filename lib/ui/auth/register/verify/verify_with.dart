import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/cubits/auth_cubit/auth_cubit.dart';
import 'package:medify/cubits/sign_cubit/sign_cubit.dart';
import 'package:medify/data/local/storage_repository/storage_repository.dart';
import 'package:medify/data/models/status/form_status.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/models/user/user_model.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/forgot_password/widgets/forgot_password_selector.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/constants/storage_keys.dart';
import 'package:medify/utils/fonts/text_styles.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/error_message_dialog.dart';

class VerifyWithScreen extends StatefulWidget {
  const VerifyWithScreen({super.key});

  @override
  State<VerifyWithScreen> createState() => _VerifyWithScreenState();
}

class _VerifyWithScreenState extends State<VerifyWithScreen> {
  int pressed = -1;
  String token = "";
  int verificationCode = 0;
  late SignUpCubit signUpCubit;

  @override
  void initState() {
    signUpCubit = BlocProvider.of<SignUpCubit>(context);
    super.initState();
  }

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
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state){
          return Column(
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
                        title: 'via SMS:\n',
                        subtitle: signUpCubit.state.phoneController.text,
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
                        title:'via Email:\n',
                        subtitle: signUpCubit.state.emailController.text,
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
                child: GlobalButton(
                    radius: 0,
                    color: AppColors.primary, textColor: AppColors.white, title: "Next", onTap: ()async{
                  if(pressed != -1){
                    UniversalData data = await context.read<AuthCubit>().signUp(context: context, verificationType: pressed == 0 ? "sms" : "email");
                    token = data.token;
                    UserModel userModel = data.data;
                    verificationCode = userModel.verificationToken;
                    print(userModel.verificationToken);
                  }
                }),
              )
            ],
          );
        },
        listener: (context, state) async{
          if (state.status == FormStatus.authenticated) {
            await StorageRepository.putString(
              StorageKeys.userToken,
              token ?? "",
            );
            if(context.mounted){
              Navigator.pushNamed(context, RouteNames.verifyScreen, arguments: pressed==0?signUpCubit.state.phoneController.text:signUpCubit.state.emailController.text);
            }
          } else if (state.status == FormStatus.failure) {
            showErrorMessage(message: state.statusMessage, context: context);
          }
        },
      ),
    );
  }
}
