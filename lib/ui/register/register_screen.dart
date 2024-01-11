import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:medify/cubits/register/register_cubit.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/profile/widgets/select_photo.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/ui/widgets/global_search_input.dart';
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
  var phoneFormatter = MaskTextInputFormatter(
      mask: '## ### ## ##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GlobalAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          title: "Fill your profile"),
      body: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          showCameraAndGalleryDialog(context, (imagePath) {
                            if (imagePath != null) {
                              context
                                  .read<RegisterCubit>()
                                  .updateFile(imagePath);
                            }
                          });
                        },
                        child: Stack(children: [
                          state.file == null
                              ? Image.asset(AppIcons.avatar, width: 150.w)
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(100.r),
                                  child: Image.file(
                                    File(state.file!),
                                    width: 150.w,
                                    height: 150.h,
                                    fit: BoxFit.cover,
                                  ),
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
                    ),
                    24.ph,
                    GlobalTextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        controller: state.fullNameController,
                        onChanged: (fullName) {
                          context
                              .read<RegisterCubit>()
                              .updateFullName(fullName);
                        },
                        focusNode: state.fullNameFocusNode,
                        hintText: "Full name"),
                    24.ph,
                    GlobalTextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        controller: state.nicknameController,
                        onChanged: (nickName) {
                          context
                              .read<RegisterCubit>()
                              .updateNickname(nickName);
                        },
                        focusNode: state.nicknameFocusNode,
                        hintText: "Nickname"),
                    24.ph,
                    GestureDetector(
                      onTap: () {
                        context.read<RegisterCubit>().showDatePicker(context);
                      },
                      child: AbsorbPointer(
                        child: GlobalSearchTextField(
                          readOnly: true,
                          hintText: 'Date of birth',
                          focusNode: state.dateOfBirthFocusNode,
                          onTap: () {
                            context
                                .read<RegisterCubit>()
                                .showDatePicker(context);
                          },
                          rightImage: AppIcons.calendar,
                          controller: state.dateOfBirthController,
                          onChanged: (value) {
                            context
                                .read<RegisterCubit>()
                                .updateDateOfBirth(value);
                          },
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                    24.ph,
                    GlobalTextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      controller: state.phoneController,
                      maskFormatter: phoneFormatter,
                      onChanged: (email) {
                        context.read<RegisterCubit>().updatePhone(email);
                      },
                      focusNode: state.phoneFocusNode,
                      hintText: "Phone",
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: SvgPicture.asset(AppIcons.call,
                            colorFilter: ColorFilter.mode(
                                state.iconColor, BlendMode.srcIn)),
                      ),
                    ),
                    24.ph,
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors
                            .greysCale, // Use the desired background color
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        underline: const SizedBox(),
                        dropdownColor: AppColors.greysCale,
                        icon: SvgPicture.asset(
                          AppIcons.getSvg(
                              name: AppIcons.arrowDown2,
                              iconType: IconType.bold),
                          colorFilter: ColorFilter.mode(
                              state.iconColor2, BlendMode.srcIn),
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                        items: state.genders.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: AppTextStyle.bodyMediumSemibold
                                  .copyWith(color: AppColors.c_900),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          context.read<RegisterCubit>().updateGender(newValue!);
                        },
                        hint: Text(state.gender,
                            style: AppTextStyle.bodyMediumSemibold.copyWith(
                                color: state.iconColor2)), // Placeholder text
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
                    Navigator.pushNamed(context, RouteNames.verifyWithScreen);
                  },
                  radius: 100.r,
                  color: AppColors.primary,
                  textColor: Colors.white,
                ),
              ),
              48.ph,
            ],
          );
        },
      ),
    );
  }
}
