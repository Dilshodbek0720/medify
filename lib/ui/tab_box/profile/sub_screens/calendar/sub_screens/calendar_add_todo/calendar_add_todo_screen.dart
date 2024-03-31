import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class CalendarAddTodo extends StatefulWidget {
  const CalendarAddTodo({super.key});

  @override
  State<CalendarAddTodo> createState() => _CalendarAddTodoState();
}

class _CalendarAddTodoState extends State<CalendarAddTodo> {
  TextEditingController sendController = TextEditingController();
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.8,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Matn',
                          hintStyle: TextStyle(
                              color: AppColors.c_700,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.white
                              )
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.white
                              )
                          ),
                        ),
                        controller: sendController,
                        style: TextStyle(
                            color: AppColors.c_800,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp
                        ),
                        minLines: 1,
                        maxLines: 1,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 20.r,
                      height: 20.r,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle
                      ),
                    ),
                  ],
                )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Divider(height: 0.6, color: AppColors.c_500),
            ),
            24.ph,
            Padding(padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
              child: Row(
                children: [
                  Icon(Icons.access_time, color: AppColors.c_900, size: 24.r,),
                  20.pw,
                  Text("Весь день",style: TextStyle(
                      color: AppColors.c_900,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp
                  ),),
                  const Spacer(),
                  Switch(
                    activeColor: AppColors.primary,
                    value: isSwitched,
                    onChanged: (v) {
                      setState(() {
                        isSwitched=isSwitched?false:true;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
