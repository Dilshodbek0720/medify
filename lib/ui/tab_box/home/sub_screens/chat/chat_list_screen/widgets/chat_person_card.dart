import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class ChatPersonCard extends StatefulWidget {
  const ChatPersonCard(
      {super.key,
        required this.index,
        required this.name,
        required this.description,
        required this.date,
        required this.count,
        required this.onTap,
        this.length = 4});

  final int index;
  final int length;
  final String name;
  final String description;
  final String date;
  final String count;
  final VoidCallback onTap;

  @override
  State<ChatPersonCard> createState() => _ChatPersonCardState();
}

class _ChatPersonCardState extends State<ChatPersonCard> {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: Image.asset(
                  AppIcons.drWatson,
                  width: 56.w,
                ),
              ),
              16.pw,
              SizedBox(
                width: 240.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontFamily: "Urbanist",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.c_900,
                      ),
                    ),
                    1.ph,
                    Text(
                      widget.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Urbanist",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.c_600,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.date,
                    style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.c_600,
                    ),
                  ),
                  12.ph,
                  Container(
                    padding: EdgeInsets.all(6.r),
                    height: 24.w,
                    width: 24.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: AppColors.primary
                    ),
                    child: Center(
                      child: Text(
                        widget.count,
                        style: TextStyle(
                          fontFamily: "Urbanist",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
