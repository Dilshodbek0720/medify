import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/search/widgets/symptoms_check_button.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class SymptomsDetailScreen extends StatefulWidget {
  const SymptomsDetailScreen({super.key, required this.title});
  final String title;

  @override
  State<SymptomsDetailScreen> createState() => _SymptomsDetailScreenState();
}

class _SymptomsDetailScreenState extends State<SymptomsDetailScreen> {
  int selectedIndex = -1;

  List<String> detailItems = [
    'Not present',
    'Present',
    'Mild',
    'Moderate',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: GlobalAppBar(
        background: const Color(0xFFF7F7F7),
        onTap: (){
          Navigator.pop(context);
        },
        title: widget.title,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView(
                children: [
                  6.ph,
                  ...List.generate(
                    detailItems.length,
                        (index) => index == 0
                        ? SymptomsCheckButton(
                      text: detailItems[index],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r)),
                      onTap: () {
                        selectedIndex = index;
                        setState(() { });
                      }, isChecked: selectedIndex == index,
                    )
                        : index != detailItems.length - 1
                        ? SymptomsCheckButton(
                      text: detailItems[index],
                          onTap: () {
                            selectedIndex = index;
                            setState(() { });
                          }, isChecked: selectedIndex == index,
                    )
                        : SymptomsCheckButton(
                      borderRadius: BorderRadius.only(
                          bottomLeft:
                          Radius.circular(20.r),
                          bottomRight:
                          Radius.circular(20.r)),
                      text: detailItems[index],
                          onTap: () {
                            selectedIndex = index;
                            setState(() { });
                          }, isChecked: selectedIndex == index,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: GlobalButton(
              onTap: (){ },
              title: 'Add',
              color: (selectedIndex >= 0 && selectedIndex <= detailItems.length-1) ? AppColors.green : const Color(0xFFA6A9AB),
              textColor: AppColors.white,
              radius: 12.r,
            ),
          )
        ],
      ),
    );
  }
}
