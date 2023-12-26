import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/forgot_password/widgets/success_dialog.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/fonts/text_styles.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/screen_size.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode repeatFocusNode = FocusNode();
  bool isPressed = false;
  bool isPressed2 = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: "Create New Password",
      ),
      body: ListView(
        padding: EdgeInsets.only(left: width * 24 / figmaWidth, right: width * 24 / figmaWidth),
        children: [
          71.ph,
          Image.asset(
            AppIcons.newPassword,
            height: height * (250 / figmaHeight),
            width: width * (329 / figmaWidth),
          ),
          71.ph,
          Text(
            "Create Your New Password",
            style: AppTextStyle.bodyXlargeMedium.copyWith(color: AppColors.c_900, letterSpacing: 0.2),
          ),
          24.ph,
          GlobalTextField(
            focusNode: passwordFocusNode,
            suffixIcon:
            getIcon(isPressed ? AppIcons.show : AppIcons.hide, context: context, onTap: () {
              setState(() {
                isPressed = !isPressed;
              });
            }),
            hintText: "Password",
            obscureText: !isPressed,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Padding(
              padding: EdgeInsets.all(20.r),
              child: SvgPicture.asset(
                AppIcons.getSvg(
                  name: AppIcons.lock,
                  iconType: IconType.bold,
                ),
                colorFilter: const ColorFilter.mode(AppColors.c_900, BlendMode.srcIn),
              ),
            ),
            controller: passwordController,
          ),
          24.ph,
          GlobalTextField(
            focusNode: repeatFocusNode,
            suffixIcon: getIcon(isPressed2 ? AppIcons.show : AppIcons.hide,
                context: context, onTap: () {
                  setState(() {
                    isPressed2 = !isPressed2;
                  });
                }),
            hintText: "Repeat Password",
            obscureText: !isPressed2,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            prefixIcon: Padding(
              padding: EdgeInsets.all(20.r),
              child: SvgPicture.asset(
                AppIcons.getSvg(name: AppIcons.lock, iconType: IconType.bold),
                colorFilter: const ColorFilter.mode(AppColors.c_900, BlendMode.srcIn),
              ),
            ),
            controller: repeatPasswordController,
          ),
          71.ph,
          GlobalButton(
            title: "Continue",
            radius: 50.r,
            onTap: () {
              successDialog(context: context,
                image: AppIcons.success,
                title: "Congratulations",
                text: "Your account is ready to use. You will be redirected to the Home page in a few seconds.."
              );
            },
            color: AppColors.primary,
            textColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}