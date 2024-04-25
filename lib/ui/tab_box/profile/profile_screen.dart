import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/data/local/storage_repository/storage_repository.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/models/user/user_model.dart';
import 'package:medify/data/network/api_service.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/widgets/chat_profile_appbar.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/widgets/profile_description_item.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/widgets/profile_image_card.dart';
import 'package:medify/ui/tab_box/profile/widgets/log_out.dart';
import 'package:medify/ui/tab_box/profile/widgets/profile_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/constants/storage_keys.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ChatProfileAppBar(
        onTap: ()async{
          ApiService apiService = ApiService();
          UniversalData data = await apiService.getUserProfile(token: StorageRepository.getString(StorageKeys.userToken));
          UserModel userModel = data.data;
          print(data.error);
          print(userModel.phoneNumber);
          print(StorageRepository.getString(StorageKeys.userToken));
        },
        background: AppColors.primary400.withOpacity(0.8),
        action: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search, color: AppColors.white,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert, color: AppColors.white,))
        ],
      ),
      // AppBar(
      //   backgroundColor: AppColors.white,
      //   toolbarHeight: 95.h,
      //   automaticallyImplyLeading: false,
      //   title: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 8.w),
      //     child: Row(
      //       children: [
      //         SizedBox(
      //           height: 48.w,
      //           width: 48.w,
      //           child: ClipRRect(
      //               borderRadius: BorderRadius.circular(30.r),
      //               child: Image.asset(AppIcons.drWatson)),
      //         ),
      //         16.pw,
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               "Welcome",
      //               style: TextStyle(
      //                   color: AppColors.c_600,
      //                   fontSize: 16.sp,
      //                   fontFamily: 'Urbanist',
      //                   fontWeight: FontWeight.w400,
      //                   letterSpacing: 0.2),
      //             ),
      //             6.ph,
      //             Text(
      //               "Else Holmes",
      //               style: TextStyle(
      //                 color: AppColors.c_900,
      //                 fontSize: 20.sp,
      //                 fontFamily: 'Urbanist',
      //                 fontWeight: FontWeight.w700,
      //               ),
      //             )
      //           ],
      //         ),
      //         const Spacer(),
      //         getIcon(AppIcons.notification, context: context, onTap: () {
      //           Navigator.pushNamed(context, RouteNames.notificationScreen);
      //         }),
      //       ],
      //     ),
      //   ),
      // ),
      body: ListView(
        physics: const ScrollPhysics(),
        children: [
          ProfileImageCard(onTap: (){
            // Navigator.pop(context);
          },
            icon: const Icon(Icons.camera_alt_outlined, color: AppColors.c_500,),
          ),
          // 24.ph,
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          //   child: GlobalTextField(
          //     borderColor: AppColors.c_300,
          //     prefixIcon: Padding(
          //       padding: EdgeInsets.only(left: 15.w, right: 10.w),
          //       child: SvgPicture.asset(AppIcons.search,
          //           colorFilter: const ColorFilter.mode(
          //               AppColors.c_500, BlendMode.srcIn)),
          //     ),
          //     contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          //     hintText: 'Search',
          //     fillColor: AppColors.white,
          //   ),
          // ),
          const ProfileDescriptionItem(title: "+998 909904044", description: "Mobile"),
          16.ph,
          const ProfileDescriptionItem(title: "@Ambition9X", description: "Username"),
          16.ph,
          const ProfileDescriptionItem(title: "Write 7275, Read 14450", description: "Bio"),
          10.ph,
          Container(
            height: 12.h,
            color: AppColors.c_200,
          ),
          12.ph,
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
              text: 'File Storage',
              icon: AppIcons.download,
              onTap: () {
                Navigator.pushNamed(
                    context, RouteNames.storageHomeScreen);
              }),
          ProfileButton(
            text: 'Calendar',
            icon: AppIcons.calendar,
            onTap: () {
              Navigator.pushNamed(context, RouteNames.calendarScreen);
            },
          ),
          20.ph,
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
