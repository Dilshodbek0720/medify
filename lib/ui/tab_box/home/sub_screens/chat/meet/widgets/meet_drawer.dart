import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/tab_box/mailing/widgets/drawer_item.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MeetDrawerWidget extends StatefulWidget {
  const MeetDrawerWidget({super.key, required this.cancelOnTap, required this.onChanged, required this.selectedIndex});
  final VoidCallback cancelOnTap;
  final ValueChanged<int> onChanged;
  final int selectedIndex;

  @override
  State<MeetDrawerWidget> createState() => _MeetDrawerWidgetState();
}

class _MeetDrawerWidgetState extends State<MeetDrawerWidget> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      backgroundColor: AppColors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Row(
              children: [
                4.pw,
                InkWell(
                  onTap: widget.cancelOnTap,
                  child: SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: SvgPicture.asset(AppIcons.arrowLeft),
                  ),
                ),
                16.pw,
                Text(
                  "Medify Meet",
                  style: TextStyle(
                      fontSize: 21.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "SF Pro Text",
                      color: AppColors.c_900),
                ),
              ],
            ),
          ),
          8.ph,
          DrawerItem(title: "Meet", icon: AppIcons.star, isSelected: widget.selectedIndex == 0, isCancel: false, onTap: () {
            widget.onChanged(0);
          },),
          DrawerItem(title: "Настройка", icon: AppIcons.setting, isSelected: widget.selectedIndex == 1, isCancel: false, onTap: () {
            widget.onChanged(1);
          },),
          DrawerItem(title: "Справка/отзыв", icon: AppIcons.star, isSelected: widget.selectedIndex == 2, isCancel: false, onTap: () {
            widget.onChanged(2);
          },),
        ],
      ),
    );
  }
}