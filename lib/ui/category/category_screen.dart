import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  List<List<String>> categoryIcons = [
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
    [AppIcons.heart,"Heart"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GlobalAppBar(
        title: "Category",
        onTap: (){
          Navigator.pop(context);
        },
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          ...List.generate(categoryIcons.length~/4, (index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 ...List.generate(4, (index){
                   return GestureDetector(
                     onTap: (){
                       // print(index);
                     },
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SizedBox(
                           width: 80.w,
                           height: 80.h,
                           child: DecoratedBox(decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(100),
                             color: AppColors.primary.withOpacity(0.2),
                           ),
                             child: Center(
                               child: SvgPicture.asset(
                                   AppIcons.getSvg(
                                   name: categoryIcons[index][0],
                                   iconType: IconType.bold),
                                   width: 40.w,
                                   colorFilter: const ColorFilter.mode(
                                       AppColors.primary, BlendMode.srcIn)),
                             ),),
                         ),
                         10.ph,
                         Text(categoryIcons[index][1],
                           style: TextStyle(
                             fontFamily: "Urbanist",
                             fontSize: 14.sp,
                             fontWeight: FontWeight.w400,
                             color: AppColors.c_900,
                           ),
                         ),
                       ],
                     ),
                   );
                 })
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
