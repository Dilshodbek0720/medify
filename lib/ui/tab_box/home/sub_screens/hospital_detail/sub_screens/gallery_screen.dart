import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/home/sub_screens/hospital_detail/widgets/gallery_image_item.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/screen_size.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: (){
          Navigator.pop(context);
        },
        title: 'Gallery',
        action: [
          getIcon(AppIcons.moreCircle, context: context, onTap: (){ }),
          10.pw,
        ],
      ),
      body: ListView(
        children: [
          24.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'Bedroom',
              style: TextStyle(
                color: AppColors.c_900,
                fontSize: 20.sp,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          16.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w,),
            child: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
            ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ...List.generate(4, (index) => GalleryImageItem(onTap: () {
                Navigator.pushNamed(context, RouteNames.galleryDetailScreen, arguments: {
                'images' : images,
                'selectedIndex' : index,
                });
                }, image: images[index],),)
              ],
            ),
          ),
          20.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'Bathroom',
              style: TextStyle(
                color: AppColors.c_900,
                fontSize: 20.sp,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          16.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w,),
            child: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
            ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ...List.generate(4, (index) => GalleryImageItem(onTap: () {
                  Navigator.pushNamed(context, RouteNames.galleryDetailScreen, arguments: {
                    'images' : images,
                    'selectedIndex' : index,
                  });
                }, image: images[index],),)
              ],
            ),
          ),
          20.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'Living Room',
              style: TextStyle(
                color: AppColors.c_900,
                fontSize: 20.sp,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          16.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w,),
            child: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
            ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ...List.generate(4, (index) => GalleryImageItem(onTap: () {
                  Navigator.pushNamed(context, RouteNames.galleryDetailScreen, arguments: {
                    'images' : images,
                    'selectedIndex' : index,
                  });
                }, image: images[index],),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<String> images = [
  AppIcons.hospital,
  AppIcons.hospital,
  AppIcons.hospital,
  AppIcons.hospital,
  AppIcons.hospital,
  AppIcons.hospital,
];
