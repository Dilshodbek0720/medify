import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';

class HoursButton extends StatefulWidget {
  const HoursButton({super.key, required this.onTap, required this.isSelect, required this.index});

  final VoidCallback onTap;
  final bool isSelect;
  final int index;

  @override
  State<HoursButton> createState() => _HoursButtonState();
}

class _HoursButtonState extends State<HoursButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: widget.isSelect
                ? Colors.greenAccent.withOpacity(0.3)
                : Colors.white,
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(
              color: widget.isSelect ? Colors.green : AppColors.c_700,
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
          child: Text(
            "${widget.index}:00 AM",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: widget.isSelect ? Colors.green : AppColors.c_700,
            ),
          ),
        ),
      ),
    );
  }
}
