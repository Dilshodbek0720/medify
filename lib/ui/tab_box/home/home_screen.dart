import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/cubits/tab/tab_cubit.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/search/widgets/doctor_card.dart';
import 'package:medify/ui/tab_box/home/widgets/categories.dart';
import 'package:medify/ui/tab_box/home/widgets/category_item.dart';
import 'package:medify/ui/tab_box/home/widgets/home_doctor_card.dart';
import 'package:medify/ui/tab_box/home/widgets/reklama_item.dart';
import 'package:medify/ui/tab_box/home/widgets/see_all_item.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/ui/widgets/global_search_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/screen_size.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _controller = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white,statusBarIconBrightness: Brightness.dark),
      ),
      backgroundColor: AppColors.white,
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
                        onTap: (){
                          context.read<TabCubit>().changeTabIndex(4);
                        },
                          child: Image.asset(AppIcons.drWatson))),
                ),
                16.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Good Morning",
                      style: TextStyle(
                        color: AppColors.c_600,
                        fontSize: 16.sp,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.2
                      ),
                    ),
                    6.ph,
                    Text("Andrew Ainsley",
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
                getIcon(AppIcons.notification, context: context, onTap: (){
                  Navigator.pushNamed(context, RouteNames.notificationScreen);
                }),
                getIcon(AppIcons.heart, context: context, onTap: (){
                  Navigator.pushNamed(context, RouteNames.favoriteScreen);
                })
              ],
            ),
          ),
          Expanded(child: ListView(
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
                        AppIcons.getSvg(name: AppIcons.filter, iconType: IconType.lightOutline),
                        colorFilter: const ColorFilter.mode(
                            AppColors.primary500, BlendMode.srcIn)),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: SvgPicture.asset(AppIcons.search,
                        colorFilter:
                        const ColorFilter.mode(AppColors.c_500, BlendMode.srcIn)),
                  ),
                  hintText: "Search",
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.name,
                ),
              ),
              24.ph,
              SizedBox(
                height: 180*MediaQuery.of(context).size.height/926,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    12.pw,
                    ...List.generate(4, (index) => const ReklamaItem(image: AppIcons.reklama,))
                  ],
                ),
              ),
              24.ph,
              SeeAllItem(onTap: (){
                Navigator.pushNamed(context, RouteNames.hospitalDetailScreen);
              }, title: 'Doctor Speciality'),
              24.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  CategoryItem(icon: AppIcons.user2, title: "General", onTap: () {  },),
                  CategoryItem(icon: AppIcons.user2, title: "General", onTap: () {  },),
                  CategoryItem(icon: AppIcons.user2, title: "General", onTap: () {  },),
                  CategoryItem(icon: AppIcons.user2, title: "General", onTap: () {  },)
                ],),
              ),
              24.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  CategoryItem(icon: AppIcons.user2, title: "General", onTap: () {  },),
                  CategoryItem(icon: AppIcons.user2, title: "General", onTap: () {  },),
                  CategoryItem(icon: AppIcons.user2, title: "General", onTap: () {  },),
                  CategoryItem(icon: AppIcons.moreCircle, title: "More", onTap: () {
                    Navigator.pushNamed(context, RouteNames.categoryScreen);
                  },)
                ],),
              ),
              24.ph,
              SeeAllItem(onTap: (){ }, title: 'Top Doctors'),
              20.ph,
              const Categories(),
              24.ph,
              SizedBox(
                height: 180*MediaQuery.of(context).size.height/926,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    12.pw,
                    ...List.generate(4, (index) => const ReklamaItem(image: AppIcons.reklama,))
                  ],
                ),
              ),
              20.ph,
              SeeAllItem(onTap: (){ }, title: 'Top Hospitals'),
              24.ph,
              SizedBox(
                height: 180*MediaQuery.of(context).size.height/926,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    12.pw,
                    ...List.generate(4, (index) => const ReklamaItem(image: AppIcons.hospital,))
                  ],
                ),
              ),
              20.ph,
            ],
          ))
        ],
      ),
    );
  }
}
