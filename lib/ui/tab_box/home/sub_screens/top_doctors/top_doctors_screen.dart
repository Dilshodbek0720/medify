import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/search/widgets/doctor_card.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';

class TopDoctorsScreen extends StatefulWidget {
  const TopDoctorsScreen({super.key});

  @override
  State<TopDoctorsScreen> createState() => _TopDoctorsScreenState();
}

class _TopDoctorsScreenState extends State<TopDoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_50,
      appBar: GlobalAppBar(
        background: AppColors.c_50,
        title: "Top Doctors",
        onTap: (){
          Navigator.pop(context);
        },
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          ...List.generate(10, (index) => DoctorsCard(length: 10,index: index, name: "Dr. Jenny Watson", category: "Immunologists", hospital: "Christ Hospital", rating: "4.4", views: "4,942"))
        ],
      ),
    );
  }
}
