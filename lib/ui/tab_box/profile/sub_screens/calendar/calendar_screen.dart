import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/cubits/calendar_doctors/calendar_doctors_cubit.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/booking_doctor/widgets/hours_button.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/calendar/widgets/calendar_drawer.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int screenIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GlobalAppBar(
            onTap: () {
              Navigator.pop(context);
            },
          action: [
            getIcon(AppIcons.search, context: context, onTap: () {}, width: 24),
            4.pw,
            GestureDetector(
              onTap: (){
                _openDrawer();
              },
              child: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: SvgPicture.asset(AppIcons.drawer),
              ),
            ),
            10.pw
          ],
        ),
        key: _scaffoldKey,
        drawer: CalendarDrawerWidget(cancelOnTap: (){
          _closeDrawer();
        }, onChanged: (int value) {
          if(value==11){
      
          }else{
            setState(() {
              screenIndex = value;
            });
          }
          Navigator.pop(context);
        }, selectedIndex: screenIndex,),
        body: BlocBuilder<CalendarDoctorsCubit, CalendarDoctorsState>(
          builder: (context, state) {
            // print("${state.startDate} checkIn");
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: TableCalendar(
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          calendarStyle: CalendarStyle(
                            outsideDaysVisible: true,
                            defaultTextStyle: TextStyle(
                                fontSize: 16.sp,
                              fontWeight: FontWeight.w600
                            ),
                            weekendTextStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600
                            )
                          ),
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
                                final text = DateFormat.E(context.locale.toString()).format(day);
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
                          selectedDayPredicate: (day) => isSameDay(state.selectedDate, day),
                          rangeStartDay: state.startDate,
                          calendarFormat: CalendarFormat.month,
                          rangeSelectionMode: state.rangeSelectionMode,
                          onRangeSelected: (start, end, focusedDay) {
                            context
                                .read<CalendarDoctorsCubit>()
                                .initializeRanges(start, start);
                          },
                          onPageChanged: (v) {
                            context
                                .read<CalendarDoctorsCubit>()
                                .changeFocusDay(v);
                          },
                        ),
                      ),
                      12.ph,
                      const Divider(height: 1, color: AppColors.c_400,),
                      12.ph,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          '27 mart',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.c_700),
                        ),
                      ),
                      20.ph,
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 24.w),
                //   child: GlobalButton(
                //     title: tr("continue"),
                //     onTap: () {
                //       Navigator.pushNamed(
                //           context, RouteNames.bookingInfoDetailScreen);
                //     },
                //     radius: 100.r,
                //     color: AppColors.primary,
                //     textColor: Colors.white,
                //   ),
                // ),
                // 40.ph,
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, RouteNames.calendarAddTodo);
          },
          backgroundColor: AppColors.white,
          child: Icon(Icons.add, color: AppColors.c_900, size: 30.r,),
        ),
      ),
    );
  }
}
