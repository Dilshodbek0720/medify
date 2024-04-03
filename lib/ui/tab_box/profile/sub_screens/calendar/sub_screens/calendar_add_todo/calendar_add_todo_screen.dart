import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/blocs/todos/todo_message_bloc.dart';
import 'package:medify/blocs/todos/todo_message_event.dart';
import 'package:medify/cubits/calendar_todo/calendar_todo_cubit.dart';
import 'package:medify/data/models/todo_message/todo_message_model.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/calendar/widgets/start_and_end_time.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class CalendarAddTodo extends StatefulWidget {
  const CalendarAddTodo({super.key});

  @override
  State<CalendarAddTodo> createState() => _CalendarAddTodoState();
}

class _CalendarAddTodoState extends State<CalendarAddTodo> {
  TextEditingController sendController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  bool isFullDate = false;
  String startSendTime = "12:00";
  String endSendTime = "13:00";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Column(
        children: [
          Expanded(
            child: ListView(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Название',
                                hintStyle: TextStyle(
                                    color: AppColors.c_600,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.sp),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.white)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.white)),
                              ),
                              controller: sendController,
                              style: TextStyle(
                                  color: AppColors.c_800,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp),
                              minLines: 1,
                              maxLines: 1,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: 20.r,
                            height: 20.r,
                            decoration: const BoxDecoration(
                                color: AppColors.primary, shape: BoxShape.circle),
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const Divider(height: 0.6, color: AppColors.c_500),
                  ),
                  24.ph,
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: AppColors.c_900,
                          size: 24.r,
                        ),
                        20.pw,
                        Text(
                          "Весь день",
                          style: TextStyle(
                              color: AppColors.c_900,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp),
                        ),
                        const Spacer(),
                        Switch(
                          activeColor: AppColors.primary,
                          value: isFullDate,
                          onChanged: (v) {
                            setState(() {
                              isFullDate = isFullDate ? false : true;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  20.ph,
                  StartAndEndTime(
                    startValueChanged: (String startTime) {
                      startSendTime = startTime;
                    },
                    endValueChanged: (String endTime) {
                      endSendTime = endTime;
                    },
                    isFullDate: isFullDate,
                  ),
                  20.ph,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const Divider(height: 0.6, color: AppColors.c_500),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.c_900,
                          size: 24.r,
                        ),
                        16.pw,
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Meсто',
                              hintStyle: TextStyle(
                                  color: AppColors.c_600,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.white)),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.white)),
                            ),
                            controller: locationController,
                            style: TextStyle(
                                color: AppColors.c_800,
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp),
                            minLines: 1,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const Divider(height: 0.6, color: AppColors.c_500),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: AppColors.c_900,
                          size: 24.r,
                        ),
                        16.pw,
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 20.h, horizontal: 8.w),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: Text(
                                "medifystudify20232024571@gmail.com",
                                style: TextStyle(
                                    color: AppColors.c_900,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const Divider(height: 0.6, color: AppColors.c_500),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.notifications,
                          color: AppColors.c_900,
                          size: 24.r,
                        ),
                        16.pw,
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 20.h, horizontal: 8.w),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: Text(
                                "За 10 мин",
                                style: TextStyle(
                                    color: AppColors.c_900,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const Divider(height: 0.6, color: AppColors.c_500),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.repeat_rounded,
                          color: AppColors.c_900,
                          size: 24.r,
                        ),
                        16.pw,
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 20.h, horizontal: 8.w),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: Text(
                                "Не повторять",
                                style: TextStyle(
                                    color: AppColors.c_900,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const Divider(height: 0.6, color: AppColors.c_500),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.event_note_sharp,
                          color: AppColors.c_900,
                          size: 24.r,
                        ),
                        16.pw,
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Примечания',
                              hintStyle: TextStyle(
                                  color: AppColors.c_600,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.white)),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.white)),
                            ),
                            controller: locationController,
                            style: TextStyle(
                                color: AppColors.c_800,
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp),
                            minLines: 1,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.videocam_outlined,
                          color: AppColors.c_900,
                          size: 24.r,
                        ),
                        16.pw,
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(vertical: 20.h, horizontal: 8.w),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: Text(
                                "Видеоконференция",
                                style: TextStyle(
                                    color: AppColors.c_900,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const Divider(height: 0.6, color: AppColors.c_500),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: AppColors.c_900,
                          size: 24.r,
                        ),
                        16.pw,
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Приглашенныя',
                              hintStyle: TextStyle(
                                  color: AppColors.c_600,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.white)),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.white)),
                            ),
                            controller: locationController,
                            style: TextStyle(
                                color: AppColors.c_800,
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp),
                            minLines: 1,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ),
          GlobalButton(title: "Add Todo",
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            onTap: (){
            if(sendController.text.isNotEmpty){
              print(startSendTime);
              context.read<TodoMessageBloc>().add(
                SendTodoMessage(
                    todoMessageModel: TodoMessageModel(
                        title: sendController.text,
                        startDate: context.read<CalendarTodoCubit>().state.startDate!,
                        endDate: context.read<CalendarTodoCubit>().state.endDate!,
                        startDateTime: startSendTime,
                        endDateTime: endSendTime
                    )),
              );
              Navigator.pop(context);
            }
          },
          color: AppColors.primary,
            textColor: AppColors.white,
          )
        ],
      ),
      ),
    );
  }
}
