import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:medify/cubits/edit_profile/edit_profile_cubit.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/ui/widgets/global_search_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var phoneFormatter = MaskTextInputFormatter(
      initialText: "+998",
      mask: '## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GlobalAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          title: tr("edit_profile")),
      body: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  children: [
                    GlobalTextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        controller: state.fullNameController,
                        onChanged: (fullName) {
                          context
                              .read<EditProfileCubit>()
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
                              .read<EditProfileCubit>()
                              .updateNickname(nickName);
                        },
                        focusNode: state.nicknameFocusNode,
                        hintText: "Nickname"),
                    24.ph,
                    GestureDetector(
                      onTap: () {
                        context
                            .read<EditProfileCubit>()
                            .showDatePicker(context);
                      },
                      child: AbsorbPointer(
                        child: GlobalSearchTextField(
                          readOnly: true,
                          hintText: 'Date of birth',
                          focusNode: state.dateOfBirthFocusNode,
                          onTap: () {
                            context
                                .read<EditProfileCubit>()
                                .showDatePicker(context);
                          },
                          rightImage: AppIcons.calendar,
                          controller: state.dateOfBirthController,
                          onChanged: (value) {
                            context
                                .read<EditProfileCubit>()
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
                      keyboardType: TextInputType.emailAddress,
                      controller: state.emailController,
                      onChanged: (email) {
                        context.read<EditProfileCubit>().updateEmail(email);
                      },
                      focusNode: state.emailFocusNode,
                      hintText: 'Email',
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: SvgPicture.asset(AppIcons.message,
                            colorFilter: ColorFilter.mode(
                                state.emailIconColor, BlendMode.srcIn)),
                      ),
                    ),
                    24.ph,
                    GlobalTextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      controller: state.phoneController,
                      maskFormatter: phoneFormatter,
                      onChanged: (phone) {
                        context.read<EditProfileCubit>().updatePhone(phone);
                      },
                      focusNode: state.phoneFocusNode,
                      hintText: "Phone",
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: SvgPicture.asset(AppIcons.call,
                            colorFilter: ColorFilter.mode(
                                state.phoneIconColor, BlendMode.srcIn)),
                      ),
                    ),
                    24.ph,
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.greysCale,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.w, right: 22.w, top: 6, bottom: 6),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          underline: const SizedBox(),
                          dropdownColor: AppColors.greysCale,
                          icon: SvgPicture.asset(
                            AppIcons.getSvg(
                                name: AppIcons.arrowDown2,
                                iconType: IconType.bold),
                            colorFilter: ColorFilter.mode(
                                state.genderIconColor, BlendMode.srcIn),
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                          items: state.genders.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                  fontFamily: "Urbanist",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.c_900,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            context
                                .read<EditProfileCubit>()
                                .updateGender(newValue!);
                          },
                          hint: Text(
                            state.gender,
                            style: TextStyle(
                              fontFamily: "Urbanist",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: state.genderIconColor,
                            ),
                          ), // Placeholder text
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GlobalButton(
                  title: tr("update"),
                  onTap: () {
                    // Navigator.pushNamed(context, RouteNames.verifyWithScreen);
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
