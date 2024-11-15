import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/cubits/tab/tab_cubit.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/tab_box/appointment/appointment_screen.dart';
import 'package:medify/ui/tab_box/history/history_screen.dart';
import 'package:medify/ui/tab_box/home/home_screen.dart';
import 'package:medify/ui/tab_box/mailing/mailing_screen.dart';
import 'package:medify/ui/tab_box/profile/profile_screen.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  static List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      const HomeScreen(),
      const AppointmentScreen(),
      const HistoryScreen(),
      const MailingScreen(),
      const ProfileScreen()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: context.watch<TabCubit>().state,
          children: screens,
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(
              fontFamily: "Urbanist",
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              height: 12 / 10,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: "Urbanist",
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: AppColors.c_500,
              height: 12 / 10,
            ),
            items: <BottomNavigationBarItem>[
              _getItem(icon: AppIcons.home, label: 'Home'),
              _getItem(icon: AppIcons.calendar, label: 'Appointment'),
              _getItem(icon: AppIcons.document, label: 'History'),
              _getItem(icon: AppIcons.paper, label: 'Mailing'),
              _getItem(icon: AppIcons.profile, label: 'Profile'),
            ],
            currentIndex: context.watch<TabCubit>().state,
            onTap: context.read<TabCubit>().changeTabIndex,
          ),
        ));
  }

  BottomNavigationBarItem _getItem({
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        AppIcons.getSvg(
          name: icon,
          iconType: IconType.bold,
        ),
        colorFilter: const ColorFilter.mode(
          AppColors.primary,
          BlendMode.srcIn,
        ),
      ),
      icon: SvgPicture.asset(
        icon,
        colorFilter: const ColorFilter.mode(
          AppColors.c_500,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}