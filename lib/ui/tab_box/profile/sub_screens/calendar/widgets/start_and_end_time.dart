import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/cubits/calendar_todo/calendar_todo_cubit.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:table_calendar/table_calendar.dart';

class StartAndEndTime extends StatefulWidget {
  const StartAndEndTime(
      {super.key,
      required this.startValueChanged,
      required this.endValueChanged,
      required this.isFullDate});
  final ValueChanged<String> startValueChanged;
  final ValueChanged<String> endValueChanged;
  final bool isFullDate;

  @override
  State<StartAndEndTime> createState() => _StartAndEndTimeState();
}

class _StartAndEndTimeState extends State<StartAndEndTime> {
  String startTime = "12:00";
  String endTime = "13:00";
  int selectedCalendar = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarTodoCubit, CalendarTodoState>(
        builder: (context, state) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                10.pw,
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        if(selectedCalendar == 1){
                          selectedCalendar = 0;
                        }else{
                          selectedCalendar = 1;
                        }
                        setState(() { });
                      },
                      child: Text(
                        "${DateFormat.E(context.locale.toString()).format(context.read<CalendarTodoCubit>().state.startDate!)}, ${DateFormat.d(context.locale.toString()).format(context.read<CalendarTodoCubit>().state.startDate!)} ${DateFormat.MMMM(context.locale.toString()).format(context.read<CalendarTodoCubit>().state.startDate!)}",
                        style: TextStyle(
                            color: AppColors.c_900,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp),
                      ),
                    ),
                    widget.isFullDate
                        ? const SizedBox()
                        : Padding(
                            padding: EdgeInsets.only(top: 12.h),
                            child: InkWell(
                              onTap: _showStartTime,
                              child: Text(
                                startTime,
                                style: TextStyle(
                                    color: AppColors.c_900,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp),
                              ),
                            ),
                          ),
                  ],
                ),
                const Spacer(),
                const SizedBox(
                  child: Icon(Icons.arrow_forward_outlined),
                ),
                const Spacer(),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        if(selectedCalendar == 2){
                          selectedCalendar = 0;
                        }else{
                          selectedCalendar = 2;
                        }
                        setState(() { });
                      },
                      child: Text(
                        "${DateFormat.E(context.locale.toString()).format(context.read<CalendarTodoCubit>().state.endDate!)}, ${DateFormat.d(context.locale.toString()).format(context.read<CalendarTodoCubit>().state.endDate!)} ${DateFormat.MMMM(context.locale.toString()).format(context.read<CalendarTodoCubit>().state.endDate!)}",
                        style: TextStyle(
                            color: AppColors.c_900,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp),
                      ),
                    ),
                    widget.isFullDate
                        ? const SizedBox()
                        : Padding(
                            padding: EdgeInsets.only(top: 12.h),
                            child: InkWell(
                              onTap: _showEndTime,
                              child: Text(
                                endTime,
                                style: TextStyle(
                                    color: AppColors.c_900,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp),
                              ),
                            ),
                          ),
                  ],
                ),
                10.pw,
              ],
            ),
          ),
          selectedCalendar == 1
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: TableCalendar(
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarStyle: CalendarStyle(
                        outsideDaysVisible: true,
                        defaultTextStyle: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                        weekendTextStyle: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600)),
                    calendarBuilders: CalendarBuilders(
                      headerTitleBuilder: (context, DateTime focusedDay) {
                        final monthName =
                            DateFormat.MMMM(context.locale.toString())
                                .format(focusedDay);
                        final year = DateFormat.y().format(focusedDay);
                        return Center(
                          child: Text(
                            '$monthName $year',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors
                                  .c_900, // Customize the color as needed
                            ),
                          ),
                        );
                      },
                      dowBuilder: (context, day) {
                        if (day.weekday == DateTime.sunday) {
                          final text = DateFormat.E(context.locale.toString())
                              .format(day);
                          return Center(
                            child: Text(
                              text,
                              style: const TextStyle(color: Colors.red),
                            ),
                          );
                        }
                        return null;
                      },
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.c_900,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    locale: context.locale.toString(),
                    firstDay: DateTime.now(),
                    rowHeight: 55.h,
                    lastDay: DateTime(2040),
                    focusedDay: state.focusedDay,
                    selectedDayPredicate: (day) =>
                        isSameDay(state.selectedDate, day),
                    rangeStartDay: state.startDate,
                    rangeSelectionMode: state.rangeSelectionMode,
                    calendarFormat: CalendarFormat.month,
                    // rangeSelectionMode: state.rangeSelectionMode,
                    onRangeSelected: (start, end, focusedDay) {
                      context
                          .read<CalendarTodoCubit>()
                          .initializeRanges(start, start);
                    },
                    onPageChanged: (v) {
                      context.read<CalendarTodoCubit>().changeFocusDay(v);
                    },
                  ),
                )
              : selectedCalendar == 2
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: TableCalendar(
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        calendarStyle: CalendarStyle(
                            outsideDaysVisible: true,
                            defaultTextStyle: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
                            weekendTextStyle: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w600)),
                        calendarBuilders: CalendarBuilders(
                          headerTitleBuilder: (context, DateTime focusedDay) {
                            final monthName =
                                DateFormat.MMMM(context.locale.toString())
                                    .format(focusedDay);
                            final year = DateFormat.y().format(focusedDay);
                            return Center(
                              child: Text(
                                '$monthName $year',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors
                                      .c_900, // Customize the color as needed
                                ),
                              ),
                            );
                          },
                          dowBuilder: (context, day) {
                            if (day.weekday == DateTime.sunday) {
                              final text =
                                  DateFormat.E(context.locale.toString())
                                      .format(day);
                              return Center(
                                child: Text(
                                  text,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              );
                            }
                            return null;
                          },
                        ),
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleTextStyle: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.c_900,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        locale: context.locale.toString(),
                        firstDay: DateTime.now(),
                        rowHeight: 55.h,
                        lastDay: DateTime(2040),
                        focusedDay: state.focusedDay,
                        rangeSelectionMode: state.rangeSelectionMode,
                        selectedDayPredicate: (day) =>
                            isSameDay(state.selectedDate, day),
                        rangeStartDay: state.startDate,
                        calendarFormat: CalendarFormat.month,
                        onRangeSelected: (start, end, focusedDay) {
                          print(start.toString());
                          print(end.toString());
                          context
                              .read<CalendarTodoCubit>()
                              .initializeRanges(end, end);
                        },
                        onPageChanged: (v) {
                          context.read<CalendarTodoCubit>().changeFocusDay(v);
                        },
                      ),
                    )
                  : const SizedBox(),
        ],
      );
    });
  }

  Future<void> _showStartTime() async {
    Navigator.of(context).push(
      showPicker(
        context: context,
        is24HrFormat: true,
        value: Time(
          hour: int.parse(
            DateTime.now().toString().substring(10, 13),
          ),
          minute: int.parse(
            DateTime.now().toString().substring(14, 16),
          ),
        ),
        iosStylePicker: true,
        onChange: (value) {
          int minute = value.minute;
          String formattedMinute = minute < 10 ? '0$minute' : minute.toString();
          int hour = value.hour;
          String formattedHour = hour < 10 ? '0$hour' : hour.toString();
          startTime = "$formattedHour:$formattedMinute";
          widget.startValueChanged(startTime);
          setState(() {});
        },
      ),
    );
    setState(() {});
  }

  Future<void> _showEndTime() async {
    Navigator.of(context).push(
      showPicker(
        context: context,
        is24HrFormat: true,
        value: Time(
          hour: int.parse(
            DateTime.now().toString().substring(10, 13),
          ),
          minute: int.parse(
            DateTime.now().toString().substring(14, 16),
          ),
        ),
        iosStylePicker: true,
        onChange: (value) {
          int minute = value.minute;
          String formattedMinute = minute < 10 ? '0$minute' : minute.toString();
          int hour = value.hour;
          String formattedHour = hour < 10 ? '0$hour' : hour.toString();
          endTime = "$formattedHour:$formattedMinute";
          widget.endValueChanged(endTime);
          setState(() {});
        },
      ),
    );
    setState(() {});
  }
}
