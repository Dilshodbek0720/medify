import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/cubits/settings_widget/settings_widget_cubit.dart';
import 'package:medify/cubits/tab/tab_cubit.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/search/widgets/doctor_card.dart';
import 'package:medify/ui/tab_box/home/widgets/category_item2.dart';
import 'package:medify/ui/tab_box/home/widgets/hospital_card.dart';
import 'package:medify/ui/tab_box/home/widgets/reklama_item.dart';
import 'package:medify/ui/tab_box/home/widgets/see_all_item.dart';
import 'package:medify/ui/tab_box/home/widgets/service_category_card.dart';
import 'package:medify/ui/tab_box/home/widgets/setting_widget_item.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/constants/constants.dart';
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
      body: BlocBuilder<SettingsWidgetCubit, SettingsWidgetState>(
        builder: (context, state) {
          return Column(
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
                      Navigator.pushNamed(
                          context, RouteNames.notificationScreen);
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
                      child: SizedBox(
                        height: 50.h,
                        child: GlobalTextField(
                          fillColor: AppColors.white,
                          borderColor: AppColors.c_400,
                          radius: 12,
                          contentPadding: EdgeInsets.symmetric(vertical: 0.h),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteNames.searchScreen);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: SvgPicture.asset(
                                  width: 20.r,
                                  height: 20.r,
                                  AppIcons.getSvg(
                                      name: AppIcons.filter,
                                      iconType: IconType.lightOutline),
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.primary500, BlendMode.srcIn)),
                            ),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.w, vertical: 0),
                            child: SvgPicture.asset(
                                width: 20.r,
                                AppIcons.search,
                                colorFilter: const ColorFilter.mode(
                                    AppColors.c_500, BlendMode.srcIn)),
                          ),
                          hintText: "Search",
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                    24.ph,
                    CarouselSlider(
                      items: [
                        ...List.generate(
                          4,
                          (index) => ReklamaItem(
                            image: AppIcons.doctorCardImage,
                            onTap: () {
                              Navigator.pushNamed(context, RouteNames.aboutMedifyScreen);
                            },
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        aspectRatio: 6.5 / 3,
                        autoPlayInterval: const Duration(seconds: 5),
                      ),
                    ),
                    SeeAllItem(
                        backgroundColor: AppColors.c_50,
                        onTap: () {},
                        title: 'Service Categories'),
                    4.ph,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ServiceCategoryCard(
                              onTap: () {},
                              icon: AppIcons.doctorIcon,
                              title: "Doctors",
                            ),
                            16.pw,
                            ServiceCategoryCard(
                              onTap: () {},
                              icon: AppIcons.hospitalIcon,
                              title: "Hospitals",
                            ),
                            16.pw,
                            ServiceCategoryCard(
                              onTap: () {},
                              icon: AppIcons.servicesIcon,
                              title: "Services",
                            ),
                          ],
                        ),
                      ),
                    ),
                    4.ph,
                    // 24.ph,
                    SeeAllItem(
                        backgroundColor: AppColors.c_50,
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteNames.categoryScreen);
                        },
                        title: 'Doctor Speciality'),
                    6.ph,
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
                    // 24.ph,
                    SeeAllItem(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteNames.topDoctorsScreen);
                        },
                        title: 'Top Doctors',
                        backgroundColor: AppColors.c_50),
                    // 6.ph,
                    CarouselSlider(
                      items: [
                        ...List.generate(
                          10,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: DoctorsCard(
                              length: 10,
                              index: index,
                              name: "Ahmadjanova Nasibaxon Erkinovna",
                              category: "Ginekolog",
                              experience: "Tajriba: 29 yil",
                              language: "uz | ru",
                              rating: "4.4",
                            ),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        viewportFraction: 1,
                        height: 155.h,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                      ),
                    ),
                    // 6.ph,
                    SeeAllItem(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteNames.topHospitalsScreen);
                        },
                        title: 'Top Hospitals',
                        backgroundColor: AppColors.c_50),
                    // 6.ph,
                    CarouselSlider(
                      items: [
                        ...List.generate(
                          10,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: const HospitalCard(),
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
                    // 6.ph,
                    SeeAllItem(
                        onTap: () {},
                        title: 'Быстрый доступ',
                        backgroundColor: AppColors.c_50),
                    // 6.ph,
                    Column(
                      children: [
                        ...List.generate(state.settingsNames.length, (index) {
                          if (state.settingsValues[index]) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: SettingWidgetItem(
                                title: state.settingsNames[index],
                                description: '100',
                                icon: settingsIcons[index],
                                onTap: () {
                                  if (state.settingsNames[index] ==
                                      settingsWidgetKeys[0]) {
                                  } else if (state.settingsNames[index] ==
                                      settingsWidgetKeys[1]) {
                                    Navigator.pushNamed(
                                        context, RouteNames.mailDetailScreen);
                                  } else if (state.settingsNames[index] ==
                                      settingsWidgetKeys[2]) {
                                    Navigator.pushNamed(
                                        context, RouteNames.calendarScreen);
                                  } else if (state.settingsNames[index] ==
                                      settingsWidgetKeys[3]) {
                                    Navigator.pushNamed(
                                        context, RouteNames.paymentListScreen);
                                  } else if (state.settingsNames[index] ==
                                      settingsWidgetKeys[4]) {
                                    Navigator.pushNamed(
                                        context, RouteNames.getLocationScreen);
                                  } else if (state.settingsNames[index] ==
                                      settingsWidgetKeys[5]) {
                                    Navigator.pushNamed(
                                        context, RouteNames.storageHomeScreen);
                                  } else if (state.settingsNames[index] ==
                                      settingsWidgetKeys[6]) {
                                    Navigator.pushNamed(
                                        context, RouteNames.myFavoriteScreen);
                                  }
                                },
                              ),
                            );
                          }
                          return const SizedBox();
                        })
                      ],
                    ),
                    16.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteNames.settingsWidget);
                          },
                          borderRadius: BorderRadius.circular(16.r),
                          child: Container(
                            padding: EdgeInsets.all(16.r),
                            decoration: BoxDecoration(
                              color: AppColors.blue.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 28.r,
                                  width: 28.r,
                                  child: SvgPicture.asset(
                                    AppIcons.setting,
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.blue, BlendMode.srcIn),
                                  ),
                                ),
                                16.pw,
                                Text(
                                  "Настроить виджеты",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    16.ph,
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
