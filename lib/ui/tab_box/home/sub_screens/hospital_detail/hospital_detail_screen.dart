import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/review_screen/widgets/review_card.dart';
import 'package:medify/ui/tab_box/home/sub_screens/hospital_detail/widgets/apartment_item.dart';
import 'package:medify/ui/tab_box/home/sub_screens/hospital_detail/widgets/bed_count_item.dart';
import 'package:medify/ui/tab_box/home/sub_screens/hospital_detail/widgets/hospital_images_widget.dart';
import 'package:medify/ui/tab_box/home/sub_screens/hospital_detail/widgets/owner_item.dart';
import 'package:medify/ui/tab_box/home/sub_screens/hospital_detail/widgets/total_price_item.dart';
import 'package:medify/ui/tab_box/home/widgets/category_item.dart';
import 'package:medify/ui/tab_box/home/widgets/see_all_item.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/screen_size.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class HospitalDetailScreen extends StatefulWidget {
  const HospitalDetailScreen({super.key});

  @override
  State<HospitalDetailScreen> createState() => _HospitalDetailScreenState();
}

class _HospitalDetailScreenState extends State<HospitalDetailScreen> {
  late GoogleMapController mapController;
  late CameraPosition initialCameraPosition;
  late CameraPosition currentCameraPosition;
  bool onCameraMoveStarted = false;

  // Future<void> _followMe({required CameraPosition cameraPosition}) async {
  //   final GoogleMapController controller = mapController
  //     ..animateCamera(
  //       CameraUpdate.newCameraPosition(cameraPosition),
  //     );
  // }

  Set<Marker> markers = {
    const Marker(markerId: MarkerId('location'),position: LatLng(41.311081,69.240562))
  };

  @override
  void initState() {
    initialCameraPosition =
        const CameraPosition(target: LatLng(41.311081,69.240562), zoom: 15);
    currentCameraPosition =
        const CameraPosition(target: LatLng(41.311081,69.240562), zoom: 15);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const HospitalImagesWidget(image: AppIcons.hospital,imageHeight: 460),
                    24.ph,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        'Modernica Apartment',
                        style: TextStyle(
                          color: AppColors.c_900,
                          fontSize: 32.sp,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    16.ph,
                    const ApartmentItem(),
                    16.ph,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        children: [
                          const BedCountItem(title: "8 Beds", icon: AppIcons.bath),
                          24.pw,
                          const BedCountItem(title: "3 bath", icon: AppIcons.bath),
                          24.pw,
                          const BedCountItem(title: "2000 sqft", icon: AppIcons.bath),
                        ],
                      ),
                    ),
                    24.ph,
                    const OwnerItem(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        'Overview',
                        style: TextStyle(
                          color: AppColors.c_900,
                          fontSize: 20.sp,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    12.ph,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut Read more...',
                        style: TextStyle(
                            color: AppColors.c_800,
                            fontSize: 16.sp,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.2
                        ),
                      ),
                    ),
                    24.ph,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text('Facilities', style: TextStyle(
                        color: AppColors.c_900,
                        fontSize: 20.sp,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                      ),),
                    ),
                    24.ph,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryItem(icon: AppIcons.user2, title: "Car Parking", onTap: () {  },),
                          CategoryItem(icon: AppIcons.user2, title: "Swimming...", onTap: () {  },),
                          CategoryItem(icon: AppIcons.user2, title: "Gym & Fitne..", onTap: () {  },),
                          CategoryItem(icon: AppIcons.user2, title: "Restaurant", onTap: () {  },)
                        ],),
                    ),
                    24.ph,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryItem(icon: AppIcons.user2, title: "Wi-fi & Ne...", onTap: () {  },),
                          CategoryItem(icon: AppIcons.user2, title: "Pet Center", onTap: () {  },),
                          CategoryItem(icon: AppIcons.user2, title: "Sport Center", onTap: () {  },),
                          CategoryItem(icon: AppIcons.user2, title: "Laundry", onTap: () {
                            Navigator.pushNamed(context, RouteNames.categoryScreen);
                          },)
                        ],),
                    ),
                    24.ph,
                    SeeAllItem(onTap: (){
                      Navigator.pushNamed(context, RouteNames.galleryScreen);
                    }, title: 'Gallary'),
                    20.ph,
                    SizedBox(
                      height: 118*height/figmaHeight,
                      width: width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          18.pw,
                          ...List.generate(6, (index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: SizedBox(
                                height: 118*height/figmaHeight,
                                width: 118*height/figmaHeight,
                                child: Image.asset(AppIcons.hospital),
                              ),
                            ),
                          )),
                          18.pw,
                        ],
                      ),
                    ),
                    24.ph,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text('Location', style: TextStyle(
                        color: AppColors.c_900,
                        fontSize: 20.sp,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                      ),),
                    ),
                    20.ph,
                    Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(children: [
                        SvgPicture.asset(
                          AppIcons.getSvg(
                            name: AppIcons.location,
                            iconType: IconType.bold,
                          ),
                          colorFilter: const ColorFilter.mode(
                              AppColors.primary, BlendMode.srcIn),
                        ),
                        8.pw,
                        Text('Grand City St. 100, New York, United States',
                          style: TextStyle(
                            color: AppColors.c_700,
                            fontSize: 14.sp,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                          ),)
                      ],),
                    ),
                    20.ph,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24.w),
                      height: 280*height/figmaHeight,
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
                    24.ph,
                    SeeAllItem(onTap: (){ }, title: '4.8 (1,275 reviews)'),
                    const ReviewCard(index: 0),
                  ],
                ),),
              TotalPriceItem(onTap: (){
                Navigator.pushNamed(context, RouteNames.calendarScreen);
              }),
            ],
          ),
          Positioned(
              child: Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Row(children: [
                  10.pw,
                  getIcon(AppIcons.arrowLeft, context: context, onTap: (){
                    Navigator.pop(context);
                  }),
                  const Spacer(),
                  getIcon(AppIcons.heart, context: context, onTap: (){ }),
                  getIcon(AppIcons.send, context: context, onTap: (){ }),
                  10.pw,
                ],),
              ),
          ),
        ],
      ),
    );
  }
}
