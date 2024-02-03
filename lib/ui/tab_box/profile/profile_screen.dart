import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/profile/widgets/log_out.dart';
import 'package:medify/ui/tab_box/profile/widgets/profile_button.dart';
import 'package:medify/ui/widgets/global_input.dart';
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
      backgroundColor: AppColors.c_50,
      appBar: AppBar(
        backgroundColor: AppColors.c_50,
        toolbarHeight: 95.h,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              SizedBox(
                height: 48.w,
                width: 48.w,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.r),
                    child: Image.asset(AppIcons.drWatson)),
              ),
              16.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                        color: AppColors.c_600,
                        fontSize: 16.sp,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.2),
                  ),
                  6.ph,
                  Text(
                    "Else Holmes",
                    style: TextStyle(
                      color: AppColors.c_900,
                      fontSize: 20.sp,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              const Spacer(),
              getIcon(AppIcons.notification, context: context, onTap: () {
                Navigator.pushNamed(context, RouteNames.notificationScreen);
              }),
            ],
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          24.ph,
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            child: GlobalTextField(
              borderColor: AppColors.c_300,
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 15.w, right: 10.w),
                child: SvgPicture.asset(AppIcons.search,
                    colorFilter: const ColorFilter.mode(
                        AppColors.c_500, BlendMode.srcIn)),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              hintText: 'Search',
              fillColor: Colors.white,
            ),
          ),
          24.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              "Profile Categories",
              style: TextStyle(
                  color: AppColors.c_900,
                  fontSize: 24.sp,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2),
            ),
          ),
          24.ph,
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
                // border: Border.all(color: AppColors.c_300),
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r)),
            child: Column(
              children: [
                ProfileButton(
                  text: tr('edit_profile'),
                  icon: AppIcons.profile,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
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
                      Navigator.pushNamed(
                          context, RouteNames.getLocationScreen);
                    }),
                ProfileButton(
                    text: tr('notification'),
                    icon: AppIcons.notification,
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteNames.controlNotification);
                    }),
                ProfileButton(
                    text: tr('payment'),
                    icon: AppIcons.wallet,
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteNames.paymentListScreen);
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
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r),bottomRight: Radius.circular(20.r)),
                    text: 'File Storage',
                    icon: AppIcons.download,
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteNames.storageHomeScreen);
                    }),
              ],
            ),
          ),
          20.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: ProfileButton(
              borderRadius: BorderRadius.circular(20.r),
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
          ),
        ],
      ),
    );
  }
}
