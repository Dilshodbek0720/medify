import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70.h,
        backgroundColor: AppColors.c_50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: getIcon(AppIcons.arrowLeft, context: context, onTap: () {
            Navigator.pop(context);
          }),
        ),
        title: GlobalTextField(
          fillColor: AppColors.c_100,
          suffixIcon: IconButton(
            splashRadius: 20,
            onPressed: () {},
            icon: SvgPicture.asset(
                AppIcons.getSvg(name: AppIcons.filter, iconType: IconType.bold),
                colorFilter: const ColorFilter.mode(
                    AppColors.primary500, BlendMode.srcIn)),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SvgPicture.asset(AppIcons.search,
                colorFilter:
                    const ColorFilter.mode(AppColors.c_500, BlendMode.srcIn)),
          ),
          hintText: "Search",
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.name,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "0 Found",
                style: TextStyle(
                  fontFamily: "Urbanist",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.c_900,
                ),
              ),
              TextButton(
                  child: Row(
                    children: [
                      Text(
                        "Default",
                        style: TextStyle(
                          fontFamily: "Urbanist",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary500,
                        ),
                      ),
                      12.pw,
                      SvgPicture.asset(AppIcons.swap,
                          width: 20,
                          colorFilter: const ColorFilter.mode(
                              AppColors.primary500, BlendMode.srcIn)),
                    ],
                  ),
                  onPressed: () {}),
            ],
          ),
          ...List.generate(4, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: DecoratedBox(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: AppColors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Row(
                  children: [
                    Image.asset(AppIcons.drWatson,width: 110.w,),
                    16.pw,
                    Column(
                      children: [
                        Text("Dr. Jenny Watson"),
                        SizedBox(
                          width: 222.w,
                            child: Divider(color: AppColors.c_200,thickness: 1,)),
                        Text("Immunologists | Christ Hospital"),

                      ],
                    )
                  ],
                ),
              ),),
            );
          })
        ],
      ),
    );
  }
}
