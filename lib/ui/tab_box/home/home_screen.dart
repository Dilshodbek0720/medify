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
import 'package:medify/ui/tab_box/home/widgets/categories.dart';
import 'package:medify/ui/tab_box/home/widgets/hospital_card.dart';
import 'package:medify/ui/tab_box/home/widgets/category_item.dart';
import 'package:medify/ui/tab_box/home/widgets/reklama_item.dart';
import 'package:medify/ui/tab_box/home/widgets/see_all_item.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/ui/widgets/global_search_input.dart';
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
                getIcon(AppIcons.heart, context: context, onTap: () {
                  Navigator.pushNamed(context, RouteNames.favoriteScreen);
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
                  fillColor: AppColors.c_100,
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
                            image: AppIcons.reklama,
                          ))
                ],
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: 180 * MediaQuery.of(context).size.height / 926,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                ),
              ),
              24.ph,
              SeeAllItem(
                  backgroundColor: AppColors.c_50,
                  onTap: () {},
                  title: 'Doctor Speciality'),
              24.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryItem(
                      icon: AppIcons.user2,
                      title: "General",
                      onTap: () {},
                    ),
                    CategoryItem(
                      icon: AppIcons.user2,
                      title: "General",
                      onTap: () {},
                    ),
                    CategoryItem(
                      icon: AppIcons.user2,
                      title: "General",
                      onTap: () {},
                    ),
                    CategoryItem(
                      icon: AppIcons.user2,
                      title: "General",
                      onTap: () {},
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
                    CategoryItem(
                      icon: AppIcons.user2,
                      title: "General",
                      onTap: () {},
                    ),
                    CategoryItem(
                      icon: AppIcons.user2,
                      title: "General",
                      onTap: () {},
                    ),
                    CategoryItem(
                      icon: AppIcons.user2,
                      title: "General",
                      onTap: () {},
                    ),
                    CategoryItem(
                      icon: AppIcons.moreCircle,
                      title: "More",
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.categoryScreen);
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
              20.ph,
              const Categories(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: const DoctorsCard(
                    index: 0,
                    name: "Dr. Jenny Watson",
                    category: "Immunologists",
                    hospital: "Christ Hospital",
                    rate: "4.4",
                    views: "4,942"),
              ),
              SeeAllItem(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.topHospitalsScreen);
                  },
                  title: 'Top Hospitals',
                  backgroundColor: AppColors.c_50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: const HospitalCard()
              ),
              20.ph,
            ],
          ))
        ],
      ),
    );
  }
}
