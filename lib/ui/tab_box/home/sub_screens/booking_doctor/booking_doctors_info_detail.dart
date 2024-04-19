import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:medify/cubits/booking_info_detail/booking_info_detail_cubit.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/ui/widgets/global_search_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class BookingDoctorsInfoDetail extends StatefulWidget {
  const BookingDoctorsInfoDetail({super.key});

  @override
  State<BookingDoctorsInfoDetail> createState() => _BookingInfoDetailState();
}

class _BookingInfoDetailState extends State<BookingDoctorsInfoDetail> {
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
          title: "Book Real Estate"),
      body: BlocBuilder<BookingInfoDetailCubit, BookingInfoDetailState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding:
                  EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  children: [
                    Text("Your Information Details",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.c_900
                    ),),
                    24.ph,
                    GlobalTextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        controller: state.fullNameController,
                        onChanged: (fullName) {
                          context
                              .read<BookingInfoDetailCubit>()
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
                              .read<BookingInfoDetailCubit>()
                              .updateNickname(nickName);
                        },
                        focusNode: state.nicknameFocusNode,
                        hintText: "Nickname"),
                    24.ph,
                    GestureDetector(
                      onTap: () {
                        context
                            .read<BookingInfoDetailCubit>()
                            .showDatePicker(context);
                      },
                      child: AbsorbPointer(
                        child: GlobalSearchTextField(
                          readOnly: true,
                          hintText: 'Date of birth',
                          focusNode: state.dateOfBirthFocusNode,
                          onTap: () {
                            context
                                .read<BookingInfoDetailCubit>()
                                .showDatePicker(context);
                          },
                          rightImage: AppIcons.calendar,
                          controller: state.dateOfBirthController,
                          onChanged: (value) {
                            context
                                .read<BookingInfoDetailCubit>()
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
                        context.read<BookingInfoDetailCubit>().updateEmail(email);
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
                        context.read<BookingInfoDetailCubit>().updatePhone(phone);
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
                            context.read<BookingInfoDetailCubit>().updateGender(newValue!);
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
                  title: tr("continue"),
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.paymentBookingsScreen);
                  },
                  radius: 100.r,
                  color: AppColors.primary,
                  textColor: Colors.white,
                ),
              ),
              40.ph,
            ],
          );
        },
      ),
    );
  }
}
