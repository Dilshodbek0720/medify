import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/tab_box/mailing/widgets/drawer_item.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StorageDrawerWidget extends StatefulWidget {
  const StorageDrawerWidget({super.key, required this.cancelOnTap, required this.onChanged, required this.selectedIndex});
  final VoidCallback cancelOnTap;
  final ValueChanged<int> onChanged;
  final int selectedIndex;

  @override
  State<StorageDrawerWidget> createState() => _StorageDrawerWidgetState();
}

class _StorageDrawerWidgetState extends State<StorageDrawerWidget> {

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
                4.pw,
                Text(
                  "Medify Диск",
                  style: TextStyle(
                      fontSize: 21.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "SF Pro Text",
                      color: AppColors.c_900),
                ),
                const Spacer(),
                InkWell(
                  onTap: widget.cancelOnTap,
                  child: SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: SvgPicture.asset(AppIcons.cancel),
                  ),
                )
              ],
            ),
          ),
          20.ph,
          DrawerItem(title: "Недавние", icon: AppIcons.star, isSelected: widget.selectedIndex == 0, isCancel: false, onTap: () {
            widget.onChanged(0);
          },),
          DrawerItem(title: "Все Файлы", icon: AppIcons.star, isSelected: widget.selectedIndex == 1, isCancel: false, onTap: () {
            widget.onChanged(1);
          },),
          DrawerItem(title: "Анализы", icon: AppIcons.star, isSelected: widget.selectedIndex == 2, isCancel: false, onTap: () {
            widget.onChanged(2);
          },),
          DrawerItem(title: "Назначения", icon: AppIcons.star, isSelected: widget.selectedIndex == 3, isCancel: false, onTap: () {
            widget.onChanged(3);
          },),
          DrawerItem(title: "Настройка", icon: AppIcons.star, isSelected: widget.selectedIndex == 4, isCancel: false, onTap: () {
            widget.onChanged(4);
          },),
          DrawerItem(title: "Справка", icon: AppIcons.star, isSelected: widget.selectedIndex == 5, isCancel: false, onTap: () {
            widget.onChanged(5);
          },),
          40.ph,
        ],
      ),
    );
  }
}