import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    super.key,
    required this.index,
    required this.message,
    required this.dateTime,
  });
  final int index;
  final String message;
  final String dateTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.audioBackground,
        borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                bottomLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.c_900,
                  ),
            ),
          ),
          4.pw,
          SizedBox(
            height: Theme.of(context).textTheme.bodyMedium!.fontSize,
            child: Text(
              dateTime,
              style: TextStyle(
                  fontSize: 12.sp
              ),
            ),
          ),
        ],
      ),
    );
  }
}
