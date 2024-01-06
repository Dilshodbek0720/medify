import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/tab_box/home/widgets/category_item.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/icons/app_icons.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

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
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          ...List.generate(5, (index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 ...List.generate(4, (index){
                   return CategoryItem(icon: AppIcons.heart, title: "Heart", onTap: (){ });
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
