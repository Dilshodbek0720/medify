import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/cubits/calendar_hospitals/calendar_hospitals_cubit.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarHospitalsScreen extends StatefulWidget {
  const CalendarHospitalsScreen({super.key});

  @override
  State<CalendarHospitalsScreen> createState() => _CalendarHospitalsScreenState();
}

class _CalendarHospitalsScreenState extends State<CalendarHospitalsScreen> {
  DateTime page = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
          title: "Book Real Estate",
          onTap: () {
            Navigator.pop(context);
          }),
      body: BlocBuilder<CalendarHospitalsCubit, CalendarHospitalsState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.all(24.r),
                  children: [
                    Text(
                      tr("select_date"),
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.c_900),
                    ),
                    20.ph,
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: AppColors.blueBackground,
                          borderRadius: BorderRadius.circular(24.r)),
                      child: TableCalendar(
                        firstDay: DateTime.now(),
                        lastDay: DateTime(2040),
                        focusedDay: state.focusedDay,
                        selectedDayPredicate: (day) => isSameDay(state.selectedDate, day),
                        rangeStartDay: state.startDate,
                        rangeEndDay: state.endDate,
                        calendarFormat: CalendarFormat.month,
                        rangeSelectionMode: state.rangeSelectionMode,
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleTextStyle: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.c_900,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onRangeSelected: (start, end, focusedDay) {
                          if (end == null) {
                            context
                                .read<CalendarHospitalsCubit>()
                                .initializeRanges(start, start);
                            context
                                .read<CalendarHospitalsCubit>()
                                .updateCheck(
                                start.toString().split(" ").first,
                                start.toString().split(" ").first);
                          } else {
                            context
                                .read<CalendarHospitalsCubit>()
                                .initializeRanges(start, end);
                            context
                                .read<CalendarHospitalsCubit>()
                                .updateCheck(
                                start.toString().split(" ").first,
                                end.toString().split(" ").first);
                          }
                        },
                        onPageChanged: (v) {
                          context
                              .read<CalendarHospitalsCubit>()
                              .changeFocusDay(v);
                        },
                        calendarStyle: const CalendarStyle(
                          outsideDaysVisible: false,
                        ),
                        calendarBuilders: CalendarBuilders(
                          headerTitleBuilder: (context, DateTime focusedDay) {
                            final monthName =
                                DateFormat.MMMM(context.locale.toString())
                                    .format(focusedDay);
                            final year = DateFormat.y().format(focusedDay);
                            return Text(
                              '$monthName $year',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors
                                    .c_900, // Customize the color as needed
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
                      ),
                    ),
                    24.ph,
                    Row(
                      children: [
                        SizedBox(
                          width: 182.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(tr("check_in"),
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.c_900)),
                              16.ph,
                              GlobalTextField(
                                focusNode: state.checkInFocus,
                                controller: state.checkIn,
                                readOnly: true,
                                hintText: tr("check_in"),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.all(20.r),
                                  child: SvgPicture.asset(
                                    AppIcons.calendar,
                                    colorFilter: ColorFilter.mode(
                                        state.checkInColor, BlendMode.srcIn),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        16.pw,
                        SizedBox(
                          width: 182.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(tr("check_out"),
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.c_900)),
                              16.ph,
                              GlobalTextField(
                                  focusNode: state.checkOutFocus,
                                  controller: state.checkOut,
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.all(20.r),
                                    child: SvgPicture.asset(
                                      AppIcons.calendar,
                                      colorFilter: ColorFilter.mode(
                                          state.checkOutColor, BlendMode.srcIn),
                                    ),
                                  ),
                                  readOnly: true,
                                  hintText: tr("check_out"))
                            ],
                          ),
                        )
                      ],
                    ),
                    24.ph,
                    Text(
                      tr("note_to_owner"),
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.c_900),
                    ),
                    16.ph,
                    GlobalTextField(
                      focusNode: state.notesFocus,
                      controller: state.notes,
                      hintText: tr("notes"),
                      maxLines: 4,
                      contentPadding: EdgeInsets.all(20.r),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GlobalButton(
                  title: tr("continue"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteNames.bookingInfoDetailScreen);
                  },
                  radius: 100.r,
                  color: AppColors.primary,
                  textColor: Colors.white,
                ),
              ),
              40.ph,
            ],
          );
        },
      ),
    );
  }
}
