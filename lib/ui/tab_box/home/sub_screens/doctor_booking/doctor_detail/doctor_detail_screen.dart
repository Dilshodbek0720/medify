import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/review_screen/widgets/review_card.dart';
import 'package:medify/ui/search/widgets/doctor_card.dart';
import 'package:medify/ui/tab_box/home/sub_screens/doctor_booking/widgets/doctor_detail_widget.dart';
import 'package:medify/ui/tab_box/home/sub_screens/doctor_booking/widgets/review_search_input.dart';
import 'package:medify/ui/tab_box/home/sub_screens/doctor_booking/widgets/working_hours_item.dart';
import 'package:medify/ui/tab_box/home/sub_screens/hospital_detail/widgets/hospital_images_widget.dart';
import 'package:medify/ui/tab_box/home/widgets/see_all_item.dart';
import 'package:medify/ui/tab_box/mailing/widgets/answer_button.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/screen_size.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorDetailScreen extends StatefulWidget {
  const DoctorDetailScreen({super.key});

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  late GoogleMapController mapController;
  late CameraPosition initialCameraPosition;
  late CameraPosition currentCameraPosition;
  bool onCameraMoveStarted = false;
  int remainingTime = 0;
  Timer? _countUpTimer;

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  void startCountUp() {
    _countUpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remainingTime++;
      // print(remainingTime);
    });
  }

  // Future<void> _followMe({required CameraPosition cameraPosition}) async {
  //   final GoogleMapController controller = mapController
  //     ..animateCamera(
  //       CameraUpdate.newCameraPosition(cameraPosition),
  //     );
  // }

  Set<Marker> markers = {
    const Marker(
        markerId: MarkerId('location'), position: LatLng(41.311081, 69.240562))
  };

  @override
  void initState() {
    startCountUp();
    initialCameraPosition =
        const CameraPosition(target: LatLng(41.311081, 69.240562), zoom: 15);
    currentCameraPosition =
        const CameraPosition(target: LatLng(41.311081, 69.240562), zoom: 15);
    super.initState();
    canLaunchUrl(Uri(scheme: 'tel', path: '+998998999739')).then((bool result) {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return PopScope(
      onPopInvoked: (v){
        print(remainingTime);
      },
      // onWillPop: (){
      //   print(remainingTime);
      //   return false;
      // },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: GlobalAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          title: "Doctor Detail",
          centerTitle: true,
          action: [
            getIcon(AppIcons.search, context: context, onTap: () {}),
            getIcon(AppIcons.moreCircle, context: context, onTap: () {}),
            10.pw,
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                const HospitalImagesWidget(image: AppIcons.doctorReklama, imageHeight: 320,),
                12.ph,
                Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: const DoctorsCard(length: 10,index: 0, name: "Katryn Murphy", category: "Therapist, Mon - Sun", hospital: "Christ Hospital", rating: "4.9"),
                ),
                12.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                  child: GlobalButton(
                    onTap: () {},
                    textColor: AppColors.white,
                    color: AppColors.green,
                    title: "Book an appointment",
                    radius: 12.r,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.w,
                    right: 24.w,
                    bottom: 36.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnswerButton(onTap: (){

                      }, title: 'Message', icon: AppIcons.send, color: AppColors.green, textColor: AppColors.green,),
                      12.pw,
                      AnswerButton(onTap: () => setState(() {
                        _makePhoneCall("+998998999739");
                      }), title: 'Make a call', icon: AppIcons.call, color: AppColors.green, textColor: AppColors.green,),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 24.w),
                //   child: const DoctorDetailItem(
                //     index: 0,
                //     name: 'Dr. Jenny Watson',
                //     category: 'Immunologists',
                //     hospital: 'Christ Hospital',
                //     rate: '4.4',
                //     views: '4,942',
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DoctorDetailWidget(
                        icon: AppIcons.user3,
                        title: "5,000+",
                        onTap: () {},
                        description: 'patients',
                        onTapWidget: () {},
                      ),
                      DoctorDetailWidget(
                        icon: AppIcons.activity,
                        title: "10+",
                        onTap: () {},
                        description: 'years exper..',
                        onTapWidget: () {},
                      ),
                      DoctorDetailWidget(
                        icon: AppIcons.user3,
                        title: "4.8",
                        onTap: () {},
                        description: 'rating',
                        onTapWidget: () {},
                      ),
                      DoctorDetailWidget(
                        icon: AppIcons.user3,
                        title: "4,942",
                        onTap: () {},
                        description: 'reviews',
                        onTapWidget: () {},
                      ),
                    ],
                  ),
                ),
                24.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    "About me",
                    style: TextStyle(
                      color: AppColors.c_900,
                      fontSize: 20.sp,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                8.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    "Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation. view more",
                    style: TextStyle(
                        color: AppColors.c_800,
                        fontSize: 14.sp,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2),
                  ),
                ),
                20.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    "Working Hours",
                    style: TextStyle(
                      color: AppColors.c_900,
                      fontSize: 20.sp,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                4.ph,
                const Divider(),
                4.ph,
                const WorkingHoursItem(),
                24.ph,
                Container(
                  height: 50.h,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: const BoxDecoration(color: AppColors.white),
                  child: Row(
                    children: [
                      Text(
                        'Address',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View on Map',
                          style: TextStyle(
                              fontFamily: "Urbanist",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                ),
                20.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.getSvg(
                          name: AppIcons.location,
                          iconType: IconType.bold,
                        ),
                        colorFilter: const ColorFilter.mode(
                            AppColors.primary, BlendMode.srcIn),
                      ),
                      8.pw,
                      Text(
                        'Grand City St. 100, New York, United States',
                        style: TextStyle(
                          color: AppColors.c_700,
                          fontSize: 14.sp,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                20.ph,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  height: 280 * height / figmaHeight,
                  child: GoogleMap(
                    onCameraMoveStarted: () {
                      setState(() {
                        onCameraMoveStarted = true;
                      });
                    },
                    onCameraMove: (CameraPosition cameraPosition) {
                      currentCameraPosition = cameraPosition;
                    },
                    markers: markers,
                    onCameraIdle: () {
                      setState(() {
                        onCameraMoveStarted = false;
                      });
                    },
                    initialCameraPosition: CameraPosition(
                      target: initialCameraPosition.target,
                      zoom: 12.0,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      setState(() {
                        mapController = controller;
                      });
                    },
                  ),
                ),
                20.ph,
                SeeAllItem(onTap: (){
                  Navigator.pushNamed(context, RouteNames.reviewScreen);
                }, title: 'Reviews'),
                4.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: ReviewSearchInput(hintText: 'Search in reviews', prefixIcon:  Container(
                    height: 10.sp,
                    width: 10.sp,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: SvgPicture.asset(AppIcons.search,
                        colorFilter: const ColorFilter.mode(
                            AppColors.primary500, BlendMode.srcIn)),
                  ),),
                ),
                6.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: const Divider(),
                ),
                4.ph,
                const ReviewCard(index: 4),
              ],
            ),),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _countUpTimer?.cancel();
    super.dispose();
  }
}
