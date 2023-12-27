import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/fonts/text_styles.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.navigateFromAuth});

  final bool navigateFromAuth;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String gender = "male";
  var genders = ["male", "female"];
  Color iconColor = AppColors.c_500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.c_900),
          backgroundColor: Colors.white,
          title: const Text(
            "Fill your profile",
            style: TextStyle(
                color: AppColors.c_900,
                fontWeight: FontWeight.w700,
                fontSize: 24),
          )),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        debugPrint("tapped");
                      },
                      child: Stack(children: [
                        Image.asset(
                          AppIcons.avatar,
                          width: 150.w,
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: SvgPicture.asset(
                            AppIcons.getSvg(
                              name: AppIcons.editSquare,
                              iconType: IconType.bold,
                            ),
                            width: 30.w,
                            colorFilter: const ColorFilter.mode(
                              AppColors.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
                24.ph,
                const GlobalTextField(hintText: "Full name"),
                24.ph,
                const GlobalTextField(hintText: "Nickname"),
                24.ph,
                const GlobalTextField(hintText: "Date of birth"),
                24.ph,
                GlobalTextField(
                    hintText: "Email",
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SvgPicture.asset(AppIcons.message,colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn)),
                  ),
                ),
                24.ph,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.greysCale, // Use the desired background color
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: const SizedBox(),
                    dropdownColor: AppColors.greysCale,
                    icon: SvgPicture.asset(
                      AppIcons.getSvg(
                          name: AppIcons.arrowDown2, iconType: IconType.bold),
                      colorFilter:
                          const ColorFilter.mode(AppColors.c_900, BlendMode.srcIn),
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                    items: genders.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: AppTextStyle.bodyMediumSemibold
                              .copyWith(color: AppColors.c_900),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        gender = newValue!;
                      });
                    },
                    hint: Text(gender,
                        style: AppTextStyle.bodyMediumSemibold
                            .copyWith(color: AppColors.c_900)), // Placeholder text
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: GlobalButton(
              title: "Continue",
              onTap: () {
                Navigator.pushNamed(context, RouteNames.enterPinScreen);
              },
              radius: 100.r,
              color: AppColors.primary,
              textColor: Colors.white,
            ),
          ),
          48.ph,
        ],
      ),
    );
  }
}
