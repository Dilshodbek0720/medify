import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/data/models/todo_message/todo_message_model.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class TodoMessageCard extends StatelessWidget {
  const TodoMessageCard({super.key, required this.todoMessageModel});
  final TodoMessageModel todoMessageModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todoMessageModel.startDateTime, style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp
            ),),
            Container(
              height: 22.h,
              width: 5.w,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                  color: AppColors.primary400.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(4.r)
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todoMessageModel.title, style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp
                ),),
                6.ph,
                Text("${todoMessageModel.startDateTime} - ${todoMessageModel.endDateTime}", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColors.c_600
                ),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
