import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/booking/widgets/booking_card.dart';
import 'package:medify/ui/booking/widgets/type_card.dart';
import 'package:medify/ui/review_screen/widgets/review_card.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
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
        onTap: (){},
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
