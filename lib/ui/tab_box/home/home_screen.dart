import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/cubits/tab/tab_cubit.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/search/widgets/doctor_card.dart';
import 'package:medify/ui/tab_box/home/widgets/category_item2.dart';
import 'package:medify/ui/tab_box/home/widgets/hospital_card.dart';
import 'package:medify/ui/tab_box/home/widgets/reklama_item.dart';
import 'package:medify/ui/tab_box/home/widgets/see_all_item.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c_50,
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
      ),
      backgroundColor: AppColors.c_50,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(24.r),
            child: Row(
              children: [
                SizedBox(
                  height: 48.w,
                  width: 48.w,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: GestureDetector(
                          onTap: () {
                            context.read<TabCubit>().changeTabIndex(4);
                          },
                          child: Image.asset(AppIcons.drWatson))),
                ),
                16.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning",
                      style: TextStyle(
                          color: AppColors.c_600,
                          fontSize: 16.sp,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2),
                    ),
                    6.ph,
                    Text(
                      "Andrew Ainsley",
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
                getIcon(AppIcons.chat, context: context, onTap: () {
                  Navigator.pushNamed(context, RouteNames.chatListScreen);
                })
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: GlobalTextField(
                    fillColor: AppColors.white,
                    borderColor: AppColors.c_400,
                    radius: 50,
                    contentPadding: EdgeInsets.symmetric(vertical: 18.h),
                    suffixIcon: IconButton(
                      splashRadius: 20,
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.searchScreen);
                      },
                      icon: SvgPicture.asset(
                          AppIcons.getSvg(
                              name: AppIcons.filter,
                              iconType: IconType.lightOutline),
                          colorFilter: const ColorFilter.mode(
                              AppColors.primary500, BlendMode.srcIn)),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.w),
                      child: SvgPicture.asset(AppIcons.search,
                          colorFilter: const ColorFilter.mode(
                              AppColors.c_500, BlendMode.srcIn)),
                    ),
                    hintText: "Search",
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.name,
                  ),
                ),
                24.ph,
                CarouselSlider(
                  items: [
                    ...List.generate(
                        4,
                        (index) => const ReklamaItem(
                              image: AppIcons.doctorReklama,
                            ))
                  ],
                  options: CarouselOptions(
                    viewportFraction: 1,
                    autoPlay: true,
                    aspectRatio: 6.5 / 3,
                    autoPlayInterval: const Duration(seconds: 5),
                  ),
                ),
                // 24.ph,
                SeeAllItem(
                    backgroundColor: AppColors.c_50,
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.categoryScreen);
                    },
                    title: 'Doctor Speciality'),
                24.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryItem2(
                        icon: AppIcons.teeth,
                        title: "General",
                        onTap: () {},
                        background: AppColors.category1,
                      ),
                      CategoryItem2(
                        icon: AppIcons.teeth,
                        title: "General",
                        onTap: () {},
                        background: AppColors.category2,
                      ),
                      CategoryItem2(
                        icon: AppIcons.teeth,
                        title: "General",
                        onTap: () {},
                        background: AppColors.category3,
                      ),
                      CategoryItem2(
                        icon: AppIcons.teeth,
                        title: "General",
                        onTap: () {},
                        background: AppColors.category4,
                      )
                    ],
                  ),
                ),
                24.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryItem2(
                        icon: AppIcons.teeth,
                        title: "General",
                        onTap: () {},
                        background: AppColors.category5,
                      ),
                      CategoryItem2(
                        icon: AppIcons.teeth,
                        title: "General",
                        onTap: () {},
                        background: AppColors.category6,
                      ),
                      CategoryItem2(
                        icon: AppIcons.teeth,
                        title: "General",
                        onTap: () {},
                        background: AppColors.category7,
                      ),
                      CategoryItem2(
                        icon: AppIcons.moreCircle,
                        title: "More",
                        background: AppColors.category8,
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteNames.categoryScreen);
                        },
                      )
                    ],
                  ),
                ),
                24.ph,
                SeeAllItem(
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.topDoctorsScreen);
                    },
                    title: 'Top Doctors',
                    backgroundColor: AppColors.c_50),
                14.ph,
                // const Categories(),
                ...List.generate(
                    5,
                        (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.w),
                      child: DoctorsCard(
                          length: 10,
                          index: index,
                          name: "Ahmadjanova Nasibaxon Erkinovna",
                          category: "Ginekolog",
                          experience: "Tajriba: 29 yil",
                          language: "uz | ru",
                          rating: "4.4",),
                    ),),
                8.ph,
                SeeAllItem(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteNames.topHospitalsScreen);
                    },
                    title: 'Top Hospitals',
                    backgroundColor: AppColors.c_50),
                CarouselSlider(
                  items: [
                    ...List.generate(
                        10,
                        (index) => const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              child: HospitalCard(),
                            ),
                    ),
                  ],
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: 275,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                  ),
                ),
                20.ph,
              ],
            ),
          )
        ],
      ),
    );
  }
}
