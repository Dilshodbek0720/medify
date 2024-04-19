import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/home/sub_screens/booking_hospital/widgets/type_card.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class OurRecommendationScreen extends StatefulWidget {
  const OurRecommendationScreen({super.key});

  @override
  State<OurRecommendationScreen> createState() => _OurRecommendationScreenState();
}

class _OurRecommendationScreenState extends State<OurRecommendationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_50,
      appBar: GlobalAppBar(
        background: AppColors.c_50,
        title: "Our Recommendation",
        onTap: (){
          Navigator.pop(context);
        },
        action: [
          getIcon(AppIcons.filter, context: context, onTap: (){
            Navigator.pushNamed(context, RouteNames.categoryScreen);
          })
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          ...List.generate(10, (index) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: TypeCard(),
          ))
        ],
      ),
    );
  }
}
