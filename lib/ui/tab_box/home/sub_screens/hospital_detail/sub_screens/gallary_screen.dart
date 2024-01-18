import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        ],
      ),
    );
  }
}
