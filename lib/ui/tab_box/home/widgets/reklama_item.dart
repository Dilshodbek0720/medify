import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class ReklamaItem extends StatelessWidget {
  const ReklamaItem({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width*0.9,
        child: Stack(
          children: [
            Image.asset(AppIcons.doctorReklama),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.9-180*MediaQuery.of(context).size.height/926,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.h, left: 24.w),
                    child: Column(
                      children: [
                        Text("Medical Checks! asdhjjdawGH",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 24.sp,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        12.ph,
                        Text("Check your health condition regularly to minimize the incidence of disease in the future.",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12.sp,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.2
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],),
          ],
        ),
    );
  }
}
