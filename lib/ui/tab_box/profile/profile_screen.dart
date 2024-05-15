import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medify/blocs/user_profile/user_profile_bloc.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/widgets/profile_description_item.dart';
import 'package:medify/ui/tab_box/profile/widgets/log_out.dart';
import 'package:medify/ui/tab_box/profile/widgets/profile_button.dart';
import 'package:medify/ui/tab_box/profile/widgets/profile_sliver_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String address = '';
  @override
  void initState() {
    context.read<UserProfileBloc>().add(GetUserProfile());
    // UserModel userModel = context.read<UserProfileBloc>().state.userModel;
    // addressConvertor(LatLng(userModel.location.pointModel.lat, userModel.location.pointModel.lng));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, userState){
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: CustomScrollView(
              slivers: [
                ProfileSliverAppBar(avatar: Image.asset(AppIcons.doctorCardImage), title: '${userState.userModel.firstName} ${userState.userModel.lastName}'),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.ph,
                      ProfileDescriptionItem(title: '+998 ${userState.userModel.phoneNumber}', description: "Mobile"),
                      16.ph,
                      ProfileDescriptionItem(title: userState.userModel.firstName, description: "Username"),
                      16.ph,
                      ProfileDescriptionItem(title: address, description: "Location"),
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
                        text: 'My Favorite',
                        icon: AppIcons.heart,
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.myFavoriteScreen);
                        },
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
                            Navigator.pushNamed(context, RouteNames.storageHomeScreen);
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
                )
              ],
            ),
          ),
        );
      }
    );
  }

  Future<void> addressConvertor(LatLng latLng) async{
    String output = 'No results found.';
    await placemarkFromCoordinates(latLng.latitude, latLng.longitude)
        .then((addresses) {
      if (addresses.isNotEmpty) {
        address =  addresses[0].toString();
      }else{
        address = output;
      }
    });
  }
}



