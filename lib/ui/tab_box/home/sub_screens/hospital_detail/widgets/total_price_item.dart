import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class TotalPriceItem extends StatelessWidget {
  const TotalPriceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price', style: TextStyle(
                color: AppColors.c_700,
                fontSize: 10.sp,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.20,
              ),),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('\$29', style: TextStyle(
                    color: AppColors.primary500,
                    fontSize: 32.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                  ),),
                  6.pw,
                  Text('/ night', style: TextStyle(
                    color: AppColors.c_700,
                    fontSize: 14.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.20,
                  ),),
                ],
              )
            ],
          ),
          20.pw,
          Expanded(
            child: GlobalButton(
              color: AppColors.primary500,
              onTap: (){ },
              title: 'Booking Now',
              textColor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
