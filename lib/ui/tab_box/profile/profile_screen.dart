import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/cubits/edit_profile/edit_profile_cubit.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/profile/widgets/log_out.dart';
import 'package:medify/ui/tab_box/profile/widgets/profile_button.dart';
import 'package:medify/ui/tab_box/profile/widgets/select_photo.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: Image.asset(
            AppIcons.splash,
            height: 32.h,
          ),
        ),
        title: Text(
          tr('profile'),
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
              color: AppColors.c_900,
              fontFamily: "Urbanist"),
        ),
        actions: [
          getIcon(
            AppIcons.moreCircle,
            context: context,
            onTap: () {
              setState(() {});
            },
          ),
          12.pw
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          BlocBuilder<EditProfileCubit, EditProfileState>(
            builder: (context, state) {
              return Center(
                child: GestureDetector(
                  onTap: () {
                    showCameraAndGalleryDialog(context, (imagePath) {
                      if (imagePath != null) {
                        context.read<EditProfileCubit>().updateFile(imagePath);
                      }
                    });
                  },
                  child: Stack(children: [
                    state.file == null
                        ? Image.asset(AppIcons.avatar, width: 150.w)
                        : CircleAvatar(
                            radius: 100.r,
                            backgroundImage: FileImage(
                              File(state.file!),
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
              );
            },
          ),
          12.ph,
          Text(
            "Andrew Ainsley",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
                color: AppColors.c_900,
                fontFamily: "Urbanist"),
          ),
          8.ph,
          Text(
            "+1 111 467 378 399",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: AppColors.c_900,
                fontFamily: "Urbanist"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: const Divider(),
          ),
          ProfileButton(
            text: tr('edit_profile'),
            icon: AppIcons.profile,
            onTap: () {
              Navigator.pushNamed(context, RouteNames.editProfileScreen);
            },
          ),
          ProfileButton(
            text: tr('my_bookings'),
            icon: AppIcons.calendar,
            onTap: () {},
          ),
          ProfileButton(
              text: tr('address'),
              icon: AppIcons.location,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.getLocationScreen);
              }),
          ProfileButton(
              text: tr('notification'),
              icon: AppIcons.notification,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.controlNotification);
              }),
          ProfileButton(
              text: tr('payment'),
              icon: AppIcons.wallet,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.paymentListScreen);
              }),
          ProfileButton(
              text: tr('security'),
              icon: AppIcons.shieldDone,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.securityScreen);
              }),
          ProfileButton(
            text: tr('language'),
            icon: AppIcons.moreCircle,
            onTap: () {
              Navigator.pushNamed(context, RouteNames.languageScreen);
            },
            isLanguage: true,
            language: tr("language_type"),
          ),
          ProfileButton(
              text: tr('privacy_policy'),
              icon: AppIcons.lock,
              onTap: () {
                // Navigator.pushNamed(context, RouteNames.privacyPolicy);
              }),
          ProfileButton(
              text: tr('help_center'),
              icon: AppIcons.infoSquare,
              onTap: () {
                // Navigator.pushNamed(context, RouteNames.helpCenterScreen);
              }),
          ProfileButton(
              text: tr('invite_friends'),
              icon: AppIcons.user3,
              onTap: () {
                // Navigator.pushNamed(context, RouteNames.inviteFriends);
              }),
          ProfileButton(
            text: tr('log_out'),
            icon: AppIcons.logOut,
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32.r),
                  ),
                ),
                backgroundColor: Colors.white,
                showDragHandle: true,
                context: context,
                builder: (context) {
                  return const LogOutItem();
                },
              );
            },
            isLogOut: true,
          ),
        ],
      ),
    );
  }
}
