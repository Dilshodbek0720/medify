import 'package:flutter/material.dart';
import 'package:medify/ui/tab_box/home/widgets/notification_item.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GlobalAppBar(
        onTap: (){
          Navigator.pop(context);
        },
        title: "Notification",
        action: [
          getIcon(AppIcons.moreCircle, context: context, onTap: (){ }),
          10.pw,
        ],
      ),
      body: ListView(
        children: [
          12.ph,
          NotificationItem(icon: AppIcons.closeSquare,transparentColor: AppColors.redTransparent,title: 'Appointment Cancelled!', description: 'You have successfully canceled your appointment with Dr. Alan Watson on December 24, 2024, 13:00 p.m. 80% of the funds will be returned to your account.', color: AppColors.red, date: 'Today | 15:36 PM',),
          NotificationItem(icon: AppIcons.calendar, transparentColor: AppColors.greenTransparent,title: "Schedule Changed", description: "You have successfully changed schedule an appointment with Dr. Alan Watson on December 24, 2024, 13:00 pm. Don't forget to activate your reminder.", color: AppColors.green, date: 'Yesterday | 09:23 AM',),
          NotificationItem(icon: AppIcons.calendar, transparentColor: AppColors.blueTransparent,title: "Appointment Success!", description: "You have successfully booked an appointment with Dr. Alan Watson on December 24, 2024, 10:00 am. Don't forget to activate your reminder.", color: AppColors.blue, date: '19 Dec, 2022 | 18:35 PM',)
        ],
      ),
    );
  }
}
