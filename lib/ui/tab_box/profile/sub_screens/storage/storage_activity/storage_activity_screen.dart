import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/storage/widgets/recent_files_card.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/storage/widgets/select_date_item.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class StorageActivityScreen extends StatefulWidget {
  const StorageActivityScreen({super.key});

  @override
  State<StorageActivityScreen> createState() => _StorageActivityScreenState();
}

class _StorageActivityScreenState extends State<StorageActivityScreen> {
  int selectedDay = 3;

  List<String> weekDays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.storageBackgroundColor,
      appBar: GlobalAppBar(
        background: AppColors.storageBackgroundColor,
        title: 'Files',
        centerTitle: true,
        onTap: (){
          Navigator.pop(context);
        },
      ),
      body: ListView(
        children: [
          20.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              children: [
                Text('Select Date',
                  style: TextStyle(
                    color: AppColors.c_900,
                    fontSize: 16.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
                const Spacer(),
                Text('January, 2022',
                  style: TextStyle(
                    color: AppColors.c_900,
                    fontSize: 12.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          15.ph,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                8.pw,
                ...List.generate(weekDays.length, (index) => SelectDateItem(isSelected: selectedDay == index, onTap: (){
                  setState(() {
                    selectedDay = index;
                  });
                }, dayName: weekDays[index], day: '${index+1}'),),
                8.pw,
              ],
            ),
          ),
          30.ph,
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
          12.ph,
          ...List.generate(10, (index) => RecentFilesCard(title: 'Meeting notes', description: '14 Mar 2021', onTap: (){
            Navigator.pushNamed(context, RouteNames.storageDetailScreen, arguments: false);
          }, icon: AppIcons.storageFiles, date: '48 GB',),)
        ],
      ),
    );
  }
}
