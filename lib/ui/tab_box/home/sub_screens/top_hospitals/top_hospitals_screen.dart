import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/tab_box/home/widgets/hospital_card.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';

class TopHospitalsScreen extends StatefulWidget {
  const TopHospitalsScreen({super.key});

  @override
  State<TopHospitalsScreen> createState() => _TopHospitalsScreenState();
}

class _TopHospitalsScreenState extends State<TopHospitalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_50,
      appBar: GlobalAppBar(
        background: AppColors.c_50,
        title: "Top Hospitals",
        onTap: (){
          Navigator.pop(context);
        },
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          ...List.generate(10, (index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: const HospitalCard(),
          ))
        ],
      ),
    );
  }
}
