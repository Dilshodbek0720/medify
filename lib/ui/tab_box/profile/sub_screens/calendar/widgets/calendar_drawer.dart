import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/tab_box/mailing/widgets/drawer_item.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalendarDrawerWidget extends StatefulWidget {
  const CalendarDrawerWidget({super.key, required this.cancelOnTap, required this.onChanged, required this.selectedIndex});
  final VoidCallback cancelOnTap;
  final ValueChanged<int> onChanged;
  final int selectedIndex;

  @override
  State<CalendarDrawerWidget> createState() => _CalendarDrawerWidgetState();
}

class _CalendarDrawerWidgetState extends State<CalendarDrawerWidget> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width*0.8,
      backgroundColor: AppColors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: widget.cancelOnTap,
                  child: SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: SvgPicture.asset(AppIcons.setting),
                  ),
                )
              ],
            ),
          ),
          8.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.horizontal,
              children: List.generate(50, (_) {
                return SizedBox(
                  width: 2.w,
                  height: 1.h,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(color: AppColors.c_600),
                  ),
                );
              }),
            ),
          ),
          16.ph,
          DrawerItem(title: "Год", icon: AppIcons.star, isSelected: widget.selectedIndex == 0, isCancel: false, onTap: () {
            widget.onChanged(0);
          },),
          DrawerItem(title: "Месяц", icon: AppIcons.star, isSelected: widget.selectedIndex == 1, isCancel: false, onTap: () {
            widget.onChanged(1);
          },),
          DrawerItem(title: "Неделя", icon: AppIcons.star, isSelected: widget.selectedIndex == 2, isCancel: false, onTap: () {
            widget.onChanged(2);
          },),
          DrawerItem(title: "День", icon: AppIcons.star, isSelected: widget.selectedIndex == 3, isCancel: false, onTap: () {
            widget.onChanged(3);
          },),
          DrawerItem(title: " Напоминания", icon: AppIcons.notification, isSelected: widget.selectedIndex == 4, isCancel: false, onTap: () {
            widget.onChanged(4);
          },),
          16.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.horizontal,
              children: List.generate(50, (_) {
                return SizedBox(
                  width: 2.w,
                  height: 1.h,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(color: AppColors.c_600),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}