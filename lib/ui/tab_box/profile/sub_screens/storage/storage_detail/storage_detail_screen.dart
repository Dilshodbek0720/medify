import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/storage/widgets/storage_files_card.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class StorageDetailScreen extends StatefulWidget {
  const StorageDetailScreen({super.key});

  @override
  State<StorageDetailScreen> createState() => _StorageDetailScreenState();
}

class _StorageDetailScreenState extends State<StorageDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.storageBackgroundColor,
      appBar: GlobalAppBar(
        title: 'Detail File',
        centerTitle: true,
        onTap: (){
          Navigator.pop(context);
        },
        background: AppColors.storageBackgroundColor,
      ),
      body: ListView(
        children: [
          20.ph,
          Padding(padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.white
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 60.w,
                    height: 60.w,
                    child: SvgPicture.asset(AppIcons.mobileApp),
                  ),
                  14.pw,
                  Text('Mobile App Design', style: TextStyle(
                    fontFamily: 'Urbanist',
                    color: AppColors.c_900,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp
                  ),),
                  const Spacer(),
                  Stack(
                    children: [
                      Container(
                        width: 100.w,
                      ),
                      Container(
                        height: 35.h,
                        width: 35.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary400,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: AppColors.primary100
                          )
                        ),
                      ),
                      Positioned(
                        left: 14.w,
                        child: Container(
                          height: 35.h,
                          width: 35.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary400,
                            shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2,
                                  color: AppColors.primary100
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 28.w,
                        child: Container(
                          height: 35.h,
                          width: 35.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary400,
                            shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2,
                                  color: AppColors.primary100
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 42.w,
                        child: Container(
                          height: 35.h,
                          width: 35.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary400,
                            shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2,
                                  color: AppColors.primary100
                              )
                          ),
                          child: const Center(child: Text('+3', style: TextStyle(
                            color: AppColors.white
                          ),)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          30.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Text('Date and Size',
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14.w),
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(6.r)
            ),
            child: Row(
              children: [
                Text('10:20 - 11:30 am',
                  style: TextStyle(
                    color: AppColors.c_700,
                    fontSize: 12.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                ),
                const Spacer(),
                Text('Size: 2 MB',
                  style: TextStyle(
                    color: AppColors.c_700,
                    fontSize: 12.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          30.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Text('Descriptions',
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14.w),
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(6.r)
            ),
            child: Text('Nam venenatis dui non commodo aliquet. Quisque eu gravida justo. Phasellus auctor, eros qui luctus, purus mauris eleifend est, in rutrum orci nibh.\n\nMorbi a consectetur metus, eget fermentum turpis. Quisque massa nisi, feugiat id est at, porta.',
              style: TextStyle(
                color: AppColors.c_700,
                fontSize: 12.sp,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
              ),
            ),
          ),
          20.ph,
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
          8.ph,
          ...List.generate(6, (index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: StorageFilesCard(title: 'Illustrations DesignS', description: '19 Feb 2022', onTap: () {
                Navigator.pushNamed(context, RouteNames.pdfViewerScreen);
              },)))
        ],
      ),
    );
  }
}
