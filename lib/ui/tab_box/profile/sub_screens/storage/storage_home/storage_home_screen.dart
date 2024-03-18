import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/storage/widgets/storage_categories_card.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/storage/widgets/storage_files_card.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/storage/widgets/storage_home_card.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class StorageHomeScreen extends StatefulWidget {
  const StorageHomeScreen({super.key});

  @override
  State<StorageHomeScreen> createState() => _StorageHomeScreenState();
}

class _StorageHomeScreenState extends State<StorageHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        background: AppColors.storageBackgroundColor,
        title: 'Home',
        centerTitle: true,
        onTap: (){
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.storageBackgroundColor,
      body: ListView(
        children: [
          20.ph,
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Text(
              'Welcome Back!',
              style: TextStyle(
                color: AppColors.c_900,
                fontSize: 22.sp,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w500,
                letterSpacing: 1
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Text(
              'Hi, James Franco',
              style: TextStyle(
                  color: AppColors.c_600,
                  fontSize: 12.sp,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1
              ),
            ),
          ),
          20.ph,
          StorageHomeCard(activityOnTap: () {
            Navigator.pushNamed(context, RouteNames.storageActivityScreen);
          },),
          27.ph,
          GlobalButton(color: AppColors.storageBlueColor, textColor: AppColors.white, title: 'ADD FILE', onTap: (){

          },padding: EdgeInsets.symmetric(horizontal: 14.w)),
          23.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Text('Categories',
              style: TextStyle(
                color: AppColors.c_900,
                fontSize: 16.sp,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
          ),
          20.ph,
          Padding(padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StorageCategoriesCard(icon: AppIcons.storagePicture, title: 'Picture', description: '2400 items',),
                StorageCategoriesCard(icon: AppIcons.storageVideo, title: 'Video', description: '195 items',)
              ],
            ),
          ),
          16.ph,
          Padding(padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StorageCategoriesCard(icon: AppIcons.storageFiles, title: 'Files', description: '1470 items',),
                StorageCategoriesCard(icon: AppIcons.storageApp, title: 'App', description: '84 items',)
              ],
            ),
          ),
          24.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Text('Recent Files',
              style: TextStyle(
                color: AppColors.c_900,
                fontSize: 16.sp,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
          ),
          15.ph,
          StorageFilesCard(title: 'Illustrations DesignS', description: '19 Feb 2022', onTap: () {  }, cardOnTap: () {  },)
        ],
      )
    );
  }
}
